  function [data, auxData, metaData, txtData, weights] = mydata_Pangasianodon_hypophthalmus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Pangasiidae';
metaData.species    = 'Pangasianodon_hypophthalmus'; 
metaData.species_en = 'Iridescent shark-catfish'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2011 02 22];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};     

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2017 11 20];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};  

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2020 06 22];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University Amsterdam'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 20]; 

%% set data
% zero-variate data
data.ab = 23/24;   units.ab = 'd';  label.ab = 'age at birth';           bibkey.ab = 'caribefish'; 
  temp.ab = C2K(28); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2.5*365; units.tp = 'd';  label.tp = 'time since birth at puberty'; bibkey.tp = 'caribefish';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 20*365;  units.am = 'd';  label.am = 'life span';              bibkey.am = 'aquariumlife';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.33;   units.Lb = 'cm';  label.Lb = 'total length at birth';  bibkey.Lb = 'MukaTuza2010';
data.Li = 130;    units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 7e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = {'LegeSuba1998'};
  comment.Wwb = 'based on egg diameter of 1.1 mm: pi/6*.11^3';
data.Wwp = 3e3;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'FAO'; % for females
data.Wwi = 44e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  
data.Ri = 150e3 * 44 * 12/ 365; units.Ri = '#/d'; label.Ri = 'reprod rate at Ww = 1.7 kg'; bibkey.Ri = 'LegeSuba1998'; %  eggs/kg/month
  temp.Ri = C2K(31); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
   
% univariate data
% time - weight
data.tWw = [ ...
 0.000 	 47.761
14.871	102.985
29.918	191.045
44.954	295.522
59.340	389.552
74.843	531.343
89.705	649.254];
units.tWw = {'d', 'g'};  label.tWw = {'time','wet weight'};  
  temp.tWw = C2K(28.6); units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'ChowChan2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '4CCCP'; % Cat of Life
metaData.links.id_ITIS = '681713'; % ITIS
metaData.links.id_EoL = '570181'; % Ency of Life
metaData.links.id_Wiki = 'Pangasianodon_hypophthalmus'; % Wikipedia
metaData.links.id_ADW = 'Pangasianodon_hypophthalmus'; % ADW
metaData.links.id_Taxo = '506681'; % Taxonomicon
metaData.links.id_WoRMS = '1015096'; % WoRMS
metaData.links.id_fishbase = 'Pangasianodon-hypophthalmus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Iridescent_shark}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MukaTuza2010'; type = 'Article'; bib = [ ...    
'author = {Mukai, Y. and Tuzan, A. D. and Shaleh, S. R. M. and Manjaji-Matsumoto, B. M.}, ' ...
'year  = {2010}, ' ...
'title = {Development of sensory organs and changes of behavior in larvae of the sutchi catfish, \emph{Pangasianodon hypophthalmus}}, ' ...  
'journal = {Fish Sci}, ' ...
'doi = {10.1007/s12562-010-0290-y}, ' ...
'volume = {76}, ' ...
'pages = {921-930}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LegeSuba1998'; type = 'Incollection'; bib = [ ...    
'author = {Legendre, M. and Subagja, J. and Slembrouck, J.}, ' ...
'year  = {1998}, ' ...
'title = {Absence of marked seasonal variations in sexual maturity of \emph{Pangasius hypophthalmus} brooders held in ponds at the {S}ukamandi station}, ' ...  
'howpublished = {\vert+\url{http://horizon.documentation.ird.fr/exl-doc/pleins_textes/doc34-08/010020348.pdf}+}, ' ...
'Booktitle = {Proc mid-term workshop of the Catfish Asia Project, Cantho, Vietnam, 11-15 May 1998}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/14154}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Pangasius_hypophthalmus/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FAO'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fao.org/fishery/culturedspecies/Pangasius_hypophthalmus/en}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'aquariumlife'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.aquariumlife.net/profiles/asian-catfish/iridescent-shark/100117.asp}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'caribefish'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.caribefish.com/}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChowChan2020'; type = 'Article'; bib = [ ...    
'author = {Md. Atick Chowdhury and Nirmal Chandra Roy and Angkur Chowdhury}, ' ...
'doi = {10.1016/j.ejar.2019.11.010}, ' ...
'year  = {2020}, ' ...
'title = {Growth, yield and economic returns of striped catfish (\emph{Pangasianodon hypophthalmus}) at different stocking densities under floodplain cage culture system}, ' ...  
'journal = {Egyptian Journal of Aquatic Research}, ' ...
'volume = {46},' ...
'pages = {91-95}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


