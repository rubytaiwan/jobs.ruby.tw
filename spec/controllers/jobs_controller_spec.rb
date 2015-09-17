require 'rails_helper'

RSpec.describe JobsController, type: :controller do

  before do
    @user = User.new
    @job = Job.new
    allow(@job).to receive(:to_param).and_return('123')
    allow(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:current_user).and_return(@user)
  end

  let(:current_user) { @user }

  describe 'GET index' do
    it 'should render successful' do
      expect(Job).to receive(:online).and_return(double("job", recent: [@job]))
      get :index

      expect(assigns[:jobs]).to eq [@job]
      expect(response).to be_success
    end

    context 'by keyword' do
      it 'should render successful' do
        online_jobs = double('jobs')
        expect(Job).to receive(:online).and_return(online_jobs)
        expect(online_jobs).to receive('search').with('rails').and_return([@job])

        get :index, keyword: 'rails'

        expect(assigns[:jobs]).to eq [@job]
        expect(response).to be_success
      end
    end

    context 'by user' do
      it 'should render successful' do
        user = double('user')
        expect(User).to receive(:find).with('99').and_return(user)
        expect(user).to receive(:jobs).and_return(user)
        expect(user).to receive(:recent).and_return([@job])

        get :index, user_id: 99

        expect(assigns[:jobs]).to eq [@job]
        expect(response).to be_success
      end
    end
  end

  describe 'GET show' do
    it 'should render successful' do
      expect(Job).to receive(:find).with('123').and_return(@job)
      get :show, id: 123

      expect(assigns[:job]).to eq @job
        expect(response).to be_success
    end
  end

  describe 'GET new' do
    it 'should render successful' do
      expect(Job).to receive(:new).and_return(@job)
      get :new

      expect(assigns[:job]).to eq @job
      expect(response).to be_success
    end
  end

  describe 'POST create' do
    it 'should save successful and redirect to show' do
      expect(current_user.jobs).to receive(:build).with('title' => 'abc').and_return(@job)
      expect(@job).to receive(:save).and_return(true)
      post :create, job: { title: 'abc' }

      expect(response).to be_redirect
    end

    it 'should save failed and render new' do
      post :create, job: { titie: '' }

      expect(response).to render_template(:new)
      expect(response).to be_success
    end
  end

  describe 'GET edit' do
    it 'should render successful' do
      expect(current_user.jobs).to receive(:find).with('123').and_return(@job)
      get :edit, id: 123

      expect(assigns[:job]).to eq @job
      expect(response).to be_success
    end
  end

  describe 'PUT update' do
    it 'should save successful and redirect to show' do
      expect(current_user.jobs).to receive(:find).with('123').and_return(@job)
      expect(@job).to receive(:update_attributes).with('title' => 'abc').and_return(true)
      put :update, id: 123, job: { title: 'abc' }

      expect(response).to be_redirect
    end

    it 'should save failed and render new' do
      expect(current_user.jobs).to receive(:find).with('123').and_return(@job)
      put :update, id: 123, job: { title: '' }

      expect(response).to render_template(:edit)
      expect(response).to be_success
    end
  end

  describe 'DELETE destroy' do
    it 'should delete successful' do
      expect(current_user.jobs).to receive(:find).with('123').and_return(@job)
      expect(@job).to receive(:destroy)
      delete :destroy, id: 123
      expect(response).to be_redirect
    end

  end

  describe 'GET/POST preview' do
    it 'should render successful' do
      expect(current_user.jobs).to receive(:build).with('title' => 'abc').and_return(@job)
      expect(@job).to receive(:valid?)

      post :preview, job: { title: 'abc' }

      expect(response).to be_success
    end
  end

  describe 'PUT open' do
    it 'should open job' do
      expect(current_user.jobs).to receive(:find).with('123').and_return(@job)
      expect(@job).to receive(:open)
      expect(@job).to receive(:save!)

      put :open, id: 123
      expect(response).to be_redirect
    end
  end

  describe 'PUT close' do
    it 'should open job' do
      expect(current_user.jobs).to receive(:find).with('123').and_return(@job)
      expect(@job).to receive(:close)
      expect(@job).to receive(:save!)

      put :close, id: 123
      expect(response).to be_redirect
    end
  end

end
