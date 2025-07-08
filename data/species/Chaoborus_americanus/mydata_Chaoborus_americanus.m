function [data, auxData, metaData, txtData, weights] = mydata_Chaoborus_americanus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Insecta'; 
metaData.order      = 'Diptera'; 
metaData.family     = 'Chaoboridae';
metaData.species    = 'Chaoborus_americanus'; 
metaData.species_en = 'Glassworm'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0eFl', '0eFp', '0eFm', 'eiTg'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'am'; 'Lb'; 'Lj'; 'Wd0'; 'Wdb'; 'Wdj'; 'Ri'}; 
metaData.data_1     = {'t-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Jan Baas';'Bas Kooijman'};    
metaData.date_subm = [2014 05 05];              
metaData.email    = {'janbaa@ceh.ac.uk'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2016 02 16];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 01]; 

%% set data
% zero-variate data

data.ab = 2;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'FedoSwif1972';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 240;  units.tj = 'd';    label.tj = 'time since birth at pupation'; bibkey.tj = 'FedoSwif1972';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 4;    units.am = 'd';    label.am = 'life span as imago';       bibkey.am = 'chebucto';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'actually less than 6 d as imago';

data.Lb  = 0.2; units.Lb  = 'cm';  label.Lb  = 'length at birth';         bibkey.Lb  = 'FedoSwif1972';
data.Lj  = 1.6; units.Lj  = 'cm';  label.Lj  = 'length at pupaption';     bibkey.Lj  = 'FedoSwif1972';

data.Wd0 = 0.251; units.Wd0 = 'mug'; label.Wd0 = 'egg dry weight';        bibkey.Wd0 = 'Lehm1998';
data.Wdb = 0.006; units.Wdb = 'mg'; label.Wdb = 'dry weight at birth';     bibkey.Wdb = 'FedoSwif1972';
data.Wdj = 0.7; units.Wdj = 'mg';   label.Wdj = 'dry weight at pupation'; bibkey.Wdj = 'FedoSwif1972';

data.Ni  = 160; units.Ni  = '#/d'; label.Ni  = 'maximum reprod rate';     bibkey.Ni  = 'FedoSwif1972';   
  temp.Ni = C2K(20);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'chebucto gives 500 for Chaoborus species';
  
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), dry weight (mg)
6.438	0.018
19.769	0.039
40.947	0.179
57.534	0.332
66.291	0.424
75.038	0.484
83.113	0.598
93.216	0.578
104.738	0.697
118.750	0.685
126.360	0.784
138.061	0.727
146.565	0.738
165.402	0.727
218.003	0.681];
units.tW   = {'d', 'mg'};  label.tW = {'time', 'dry weight'};  
temp.tW    = C2K(20);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'FedoSwif1972';
comment.tW = 'time zero is at 1 July 1971 in Eunice lake; temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 50 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Model hax was fitted, but little is known about pupal development';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'C. americanus  lives mainly as a larvea with 4 instar stadia';
metaData.bibkey.F1 = 'FedoSwif1972'; 
F2 = 'At emergence it lives for a few more days without eating and lays eggs. In its larval stage it is benthic';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'Chaoborus has a one year life cycle; body length of instar IV can grow from 9 to 12 mm.';
metaData.bibkey.F3 = 'FedoSwif1972'; 
F4 = 'Chaoborus larva has modified antennae with which is can grap small prey, such as crustaceans, chironomid larvae, olichochaetes';
metaData.bibkey.F4 = {'chebucto','Wiki'}; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = 'TM7C'; % Cat of Life
metaData.links.id_ITIS = '125906'; % ITIS
metaData.links.id_EoL = '741193'; % Ency of Life
metaData.links.id_Wiki = 'Chaoborus'; % Wikipedia
metaData.links.id_ADW = 'Chaoborus_americanus'; % ADW
metaData.links.id_Taxo = '312131'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chaoborus}}';
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
bibkey = 'FedoSwif1972'; type = 'Article'; bib = [ ... 
'author = {A. Y. Fedorenko and M. C. Swift}, ' ... 
'year = {1972}, ' ...
'title = {Comparative biology of \emph{Chaobous americana} and \emph{Chaoborus trivittastus} in {E}unice {L}ake, {B}ritish {C}olumbia}, ' ...
'journal = {Limnology and Oceanography}, ' ...
'volume = {17}, ' ...
'number = {5}, '...
'pages = {721--730}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'chebucto'; type = 'Misc'; bib = ...
'howpublished = {\url{http://lakes.chebucto.org/ZOOBENTH/BENTHOS/xvii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Lehm1998'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Lehman, J. T.}, ' ...
'year = {1998}, ' ...
'title  = {Environmental Change and Response in East African Lakes}, ' ...
'publisher = {Springer}, ' ...
'pages = {138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

