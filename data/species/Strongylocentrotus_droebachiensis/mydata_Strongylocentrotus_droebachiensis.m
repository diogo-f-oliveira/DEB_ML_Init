function [data, auxData, metaData, txtData, weights] = mydata_Strongylocentrotus_droebachiensis

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Echinoidea'; 
metaData.order      = 'Camarodonta'; 
metaData.family     = 'Strongylocentrotidae';
metaData.species    = 'Strongylocentrotus_droebachiensis'; 
metaData.species_en = 'Green sea urchin'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MPN', 'MAN', 'MN'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjHa', 'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
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
  temp.tj = C2K(12);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'temps are guessed; tj based on that of Echinus_esculentus';
data.am = 16*365;    units.am = 'd';    label.am = 'life span';             bibkey.am = 'guess';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'guess based on Echinus_esculentus';

data.Lp  = 2.175;  units.Lp  = 'cm';  label.Lp  = 'test diameter at puberty';   bibkey.Lp  = 'ADW';
  comment.Lp = 'based on same relative length compared to S. purpuratus: (2.5/10)*Li';
data.Li  = 8.7;    units.Li  = 'cm';  label.Li  = 'ultimate test diameter';     bibkey.Li  = 'Wiki';

data.Wwb = 2.68e-7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'echinobase';
  comment.Wwb = 'based on egg diameter of 80 mum of S. purpuratus: pi/6*0.008^3';
data.Wwp = 4.78;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'ADW';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 306;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'LarsVada1980';
  comment.Wwi = 'based on 4.3 cm test diam corresponds with 37 g: (Li/4.3)^3*37';

data.GSI = 0.21;    units.GSI = '-';   label.GSI = 'gonado somatic index';       bibkey.GSI = 'MeidSche1998';
  temp.GSI = C2K(12);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 

% uni-variate data

% t-L data
data.tW = [ ... % time  (yr), wet weight (g)
0.008	4.099
0.084	4.320
0.168	5.495
0.260	7.456
0.332	9.025
0.412	10.144
0.500	11.600
0.580	14.236
0.660	17.040
0.728	19.789
0.816	19.953
0.904	21.015
0.988	23.370
1.072	27.972
1.144	31.676
1.240	34.199
1.324	35.936
1.388	37.112
1.488	37.387];
data.tW(:,1) = data.tW(:,1) * 365; % convert yr to d
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(12);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'LarsVada1980';
comment.tW = 'feeding on Laminaria longicruris';
  
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

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was support by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '534LX'; % Cat of Life
metaData.links.id_ITIS = '157969'; % ITIS
metaData.links.id_EoL = '599668'; % Ency of Life
metaData.links.id_Wiki = 'Strongylocentrotus_droebachiensis'; % Wikipedia
metaData.links.id_ADW = 'Strongylocentrotus_droebachiensis'; % ADW
metaData.links.id_Taxo = '114860'; % Taxonomicon
metaData.links.id_WoRMS = '124321'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lytechinus_variegatus}}';
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
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Strongylocentrotus_purpuratus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

