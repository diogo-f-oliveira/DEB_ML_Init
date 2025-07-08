function [data, auxData, metaData, txtData, weights] = mydata_Blarina_brevicauda

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Eulipotyphla'; 
metaData.family     = 'Soricidae';
metaData.species    = 'Blarina_brevicauda'; 
metaData.species_en = 'Northern short-tailed shrew'; 

metaData.ecoCode.climate = {'Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 04]; 

%% set data
% zero-variate data

data.tg = 17;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 22;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 46;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(38.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 65;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';   bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.3);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 2.2*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
    
data.Wwb = 1.34;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 21.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 3*6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 litters per yr, 6 pups per litter';

% uni-variate data

% time-weight
data.tWw = [ ... % time since birth (mnth), weight (g)
0.958	14.260
2.017	16.346
2.996	16.122
3.994	16.517
5.584	17.058
7.540	18.795
9.435	19.316
11.473	20.415
14.000	20.856];
data.tWw(:,1) = 30.5 *  data.tWw(:,1); % convert mnth to d
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'weight'};  
temp.tWw  = C2K(38.3);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Daps1968';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 50 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
%weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = 'M22V'; % Cat of Life
metaData.links.id_ITIS = '179967 '; % ITIS
metaData.links.id_EoL = '327368'; % Ency of Life
metaData.links.id_Wiki = 'Blarina_brevicauda'; % Wikipedia
metaData.links.id_ADW = 'Blarina_brevicauda'; % ADW
metaData.links.id_Taxo = '60846'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13700342'; % MSW3
metaData.links.id_AnAge = 'Blarina_brevicauda'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Blarina_brevicauda}}';
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
bibkey = 'Daps1968'; type = 'Article'; bib = [ ... 
'author = {Richard W. Dapson}, ' ... 
'year = {1968}, ' ...
'title = {Growth Patterns in a Post-juvenile Population of Short-tailed Shrews (\emph{Blarina brevicauda})}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {79(1)}, ' ...
'pages = {118-129}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Blarina_brevicauda}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

