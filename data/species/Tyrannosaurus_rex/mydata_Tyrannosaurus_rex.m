function [data, auxData, metaData, txtData, weights] = mydata_Tyrannosaurus_rex

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Theropoda'; 
metaData.family     = 'Tyrannosauridae';
metaData.species    = 'Tyrannosaurus_rex'; 
metaData.species_en = 'Tyrannosaurus';

metaData.ecoCode.climate = {'BS', 'Df'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTi'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvr', 'biSvr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2021 08 29];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 08 29]; 

%% set data
% zero-variate data

data.tp = 18*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 65*365;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Wiki';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Wiki suggest 28 yr, but im view of growth assumed to be somewhat larger';

data.Wwb = 3e3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'Learning';
  comment.Wwb = 'Very speculative';
data.Wwi = 8e6; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'Wiki';

data.Ri  = 160/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'Learning';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Very speculative, see D1; Ri increased from 30 eggs/yr in mod_1 to 160 in mod_2';
 
data.wR = 10; units.wR = 'g/mol';   label.wR = 'neonate mass per O2';             bibkey.wR = 'Kooy2021';

% uni-variate data
% t-W data
data.tW = [ ... % time since birth (yr), wet weight (kg)
1.657	60.263
13.971	1785.740
14.973	1746.271
15.932	2980.420
17.933	3219.890
22.238	5022.313
27.965	5680.929];  
units.tW   = {'yr', 'kg'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'EricMako2004';
comment.tW = 'Temperature is speculative; weights reconstructured from bone lengths';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tp = 3 * weights.tp;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio'; weights.psd.k = 0.5;
weights.psd.k_J = 0;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Several data are very speculative, such as T, Wwb, Ri';
D2 = 'Neonate growth is possibly retarted by lower body temperature';
D3 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D4 = 'mod_2: w_R is used to reduce degrees of freedom and estimate Ri';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'Extinct, lived 68 till 66 Ma ago';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/08
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4433638'; % Ency of Life
metaData.links.id_Wiki = 'Tyrannosaurus_rex'; % Wikipedia
metaData.links.id_Taxo = '50842'; % Taxonomicon

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tyrannosaurus_rex}}';
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
bibkey = 'EricMako2004'; type = 'Article'; bib = [ ... 
'author = {G. M. Erickson and P. J. Makovicky and P. J. Currie and M. A. Norell and, S. A. Yerby and C. A. Brochu}, ' ... 
'year = {2004}, ' ...
'title = {Gigantism and comparative life-history parameters of tyrannosaurid dinosaurs}, ' ...
'journal = {Nature}, ' ...
'volume = {430}, ' ...
'pages = {772--775}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Learning'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.enchantedlearning.com/subjects/dinosaurs/anatomy/Repro.shtml}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2021'; type = 'Misc'; bib = [ ...
'author = {Kooijman, S. A. L. M.}, ' ...
'note = {newly discover pattern among animals}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

