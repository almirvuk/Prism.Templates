using Prism.Ioc;
using Prism.Modularity;
using Module.XF.Views;
using Module.XF.ViewModels;

namespace Module.XF
{
    public class ModuleName : IModule
    {
        public void OnInitialized(IContainerProvider containerProvider)
        {
            
        }

        public void RegisterTypes(IContainerRegistry containerRegistry)
        {
            containerRegistry.RegisterForNavigation<ViewA, ViewAViewModel>();
        }
    }
}
