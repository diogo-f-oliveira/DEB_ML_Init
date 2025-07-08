function [data, auxData, metaData, txtData, weights] = mydata_Strongylocentrotus_purpuratus

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Echinoidea'; 
metaData.order      = 'Camarodonta'; 
metaData.family     = 'Strongylocentrotidae';
metaData.species    = 'Strongylocentrotus_purpuratus'; 
metaData.species_en = 'Purple sea urchin'; 
metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjHa', 'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2017 09 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 05]; 

%% set data
% zero-variate data

data.tj = 45;    units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'guess';
  temp.tj = C2K(7);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'temps are guessed; tj based on that of Echinus_esculentus';
data.am = 70*365;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Wiki';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2.5;    units.Lp  = 'cm';  label.Lp  = 'test diameter at puberty';   bibkey.Lp  = 'ADW';
  comment.Lp = 'diameter at first spawing is 4 cm';
data.Li  = 10;    units.Li  = 'cm';  label.Li  = 'ultimate test diameter';     bibkey.Li  = 'Wiki';

data.Wwb = 2.68e-7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'echinobase';
  comment.Wwb = 'based on egg diameter of 80 mum: pi/6*0.008^3';
data.Wwp = 7.3;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'ADW';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 465;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'LarsVada1980';
  comment.Wwi = 'based on length-weight of S. droebachiensis: (Li/4.3)^3*37';

data.GSI = 0.21;   units.GSI = '-';   label.GSI = 'gonado somatic index';       bibkey.GSI = 'MeidSche1998';
  temp.GSI = C2K(7);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 
  comment.GSI = 'value taken from S. droebachiensis';

% uni-variate data

% t-L data
data.tL = [ ... % time since start experiment (yr), test diameter (cm)
0.021	1.155
0.084	1.352
0.184	1.557
0.254	1.923
0.326	2.130
0.421	2.314
0.522	2.562
0.691	2.655
0.786	2.807
0.872	3.035
0.959	3.294
1.035	3.415
1.135	3.567
1.225	3.730
1.296	3.799
1.394	3.792
1.475	3.924
1.556	4.088
1.656	4.240
1.726	4.288
1.815	4.313
1.897	4.519
1.982	4.640
2.072	4.761
2.167	4.860
2.247	4.949
2.341	5.006
2.430	5.010
2.482	5.081
2.581	5.148
2.684	5.172
2.749	5.156];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time', 'test diameter'};  
temp.tL    = C2K(7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bool1966';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Occasionally hermaphroditic';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '534ML'; % Cat of Life
metaData.links.id_ITIS = '157975'; % ITIS
metaData.links.id_EoL = '598175'; % Ency of Life
metaData.links.id_Wiki = 'Strongylocentrotus_purpuratus'; % Wikipedia
metaData.links.id_ADW = 'Strongylocentrotus_purpuratus'; % ADW
metaData.links.id_Taxo = '41153'; % Taxonomicon
metaData.links.id_WoRMS = '240747'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Strongylocentrotus_purpuratus}}';
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
bibkey = 'Bool1966'; type = 'Book'; bib = [ ... 
'author = {Boolootian, R. A.}, ' ... 
'year = {1966}, ' ...
'title = {Physiology of Echinodermata}, ' ...
'publisher = {Intersci Publ.}, ' ...
'address = {New York}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Strongylocentrotus_purpuratus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LarsVada1980'; type = 'Article'; bib = [ ... 
'author = {B. R. Larson and R. L. Vadas and M. Keser}, ' ... 
'year = {1980}, ' ...
'title = {Feeding and Nutritional Ecology of the Sea Urchin \emph{Strongylocentrotus drobach&nsis} in {M}aine, {U}{S}{A}}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {59}, ' ...
'pages = {49--62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MeidSche1998'; type = 'Article'; bib = [ ... 
'author = {S. K. Meidel and R. E. Scheibling}, ' ... 
'year = {1998}, ' ...
'title = {Annual reproductive cycle of the green sea urchin, \emph{Strongylocentrotus droebachiensis}, in differing habitats in {N}ova {S}cotia, {C}anada}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {131}, ' ...
'pages = {461--478}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'echinobase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.echinobase.org/Echinobase/SpAbout}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

