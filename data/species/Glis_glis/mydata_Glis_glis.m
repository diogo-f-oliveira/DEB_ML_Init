function [data, auxData, metaData, txtData, weights] = mydata_Glis_glis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Gliridae';
metaData.species    = 'Glis_glis'; 
metaData.species_en = 'Edible dormouse';

metaData.ecoCode.climate = {'Cfb', 'Csa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf', '0iThh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 'Ww-JO'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 01 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 01 24]; 

%% set data
% zero-variate data

data.tg = 25;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 33;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 322;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'for female, 335 d for male';
data.am = 8.7*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'ADW';   
  temp.am = C2K(37.7);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 1.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'AnAge';
data.Wwi = 125; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'AnAge';

data.Ri  = 4*1.2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [..., % time since birth (d), weight (g)
2.003	3.718
3.953	4.966
5.000	5.770
5.975	6.758
6.913	6.927
7.961	8.368
9.045	9.718
10.020	11.069
10.958	10.420
11.971	13.316
13.090	14.211
13.995	17.108
14.970	17.641
16.054	19.718
16.993	20.524
18.042	23.419
19.051	22.406
20.064	25.393
21.076	27.016
21.943	28.368
22.991	29.718
24.041	33.523
25.049	31.874
25.989	33.134
28.011	34.835
29.023	36.731
30.036	39.718
31.084	42.068];
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW = C2K(37.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Gebc1981';

data.WJO = [ ... % weight (g), O2 use (cm^3/h.g)
 3.6 2.02
 5.1 2.62
 6.7 3.06
 8.7 3.41
11.0 3.62
13.9 3.75
17.2 2.41
20.0 2.28
23.4 1.78
26.1 1.97
28.8 1.94
32.7 1.40
39.9 1.60];
data.WJO(:,2) = prod(data.WJO, 2); % convert cm^3/h.g to cm^3/h)
units.WJO = {'g', 'cm^3/h'};  label.WJO = {'weight', 'O_2 consumption'};  
temp.WJO = C2K(37.7);  units.temp.WJO = 'K'; label.temp.WJO = 'temperature';
bibkey.WJO = 'Gebc1981';
comment.WJO = 'Ambient temp 26-27 C';

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

%% Links
metaData.links.id_CoL = '3G9QL'; % Cat of Life
metaData.links.id_ITIS = '951305'; % ITIS
metaData.links.id_EoL = '327942'; % Ency of Life
metaData.links.id_Wiki = 'Glis_glis'; % Wikipedia
metaData.links.id_ADW = 'Glis_glis'; % ADW
metaData.links.id_Taxo = '168233'; % Taxonomicon
metaData.links.id_WoRMS = '1506675'; % WoRMS
metaData.links.id_MSW3 = '12500044'; % MSW3
metaData.links.id_AnAge = 'Glis_glis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Glis_glis}}';
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
bibkey = 'Gebc1981'; type = 'Article'; bib = [ ... 
'author = {M. Gebczynski}, ' ... 
'year = {1981}, ' ...
'title = {The oxygen consumption in growing Fat dormice, \emph{Glis glis}}, ' ...
'journal = {Z. S\"{a}ugetierkunde}, ' ...
'volume = {46}, ' ...
'pages = {289--295}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Myoxus_glis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Glis_glis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

