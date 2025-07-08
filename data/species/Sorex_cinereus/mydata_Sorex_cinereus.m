function [data, auxData, metaData, txtData, weights] = mydata_Sorex_cinereus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Eulipotyphla'; 
metaData.family     = 'Soricidae';
metaData.species    = 'Sorex_cinereus'; 
metaData.species_en = 'Cinereus shrew'; 

metaData.ecoCode.climate = {'Dfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTh','0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM','xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 03]; 

%% set data
% zero-variate data

data.tg = 19;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 23;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 154;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(38.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 1.5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(38.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'less than 1 to 2 yr';
    
data.Wwb = 0.28;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 4.3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 6.22/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(38.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 litter per yr, 6.22 pups per litter';

% uni-variate data

% time-weight data
data.tWw = [ ... % time since birth (d), weight (g)
0.000	0.271
0.000	0.237
0.032	0.325
0.032	0.298
0.064	0.372
2.038	0.636
2.038	0.609
2.038	0.548
2.038	0.514
2.038	0.426
2.962	0.873
2.994	0.846
2.994	0.832
2.994	0.765
3.025	0.724
3.949	1.130
3.949	1.049
4.013	1.008
5.987	1.448
5.987	1.414
6.019	1.766
6.019	1.719
6.019	1.691
6.019	1.644
6.051	1.536
6.051	1.509
8.025	2.219
8.025	2.192
8.025	2.179
8.025	2.131
8.025	2.097
8.025	2.084
8.057	2.050
9.013	2.551
9.045	2.388
9.045	2.361
9.076	2.456
9.076	2.429
10.955	2.808
10.987	3.051
10.987	3.085
10.987	3.133
11.019	2.835
11.019	2.889
11.019	2.991
12.038	2.896
12.962	3.512
12.994	3.451
12.994	3.322
13.981	3.390
13.981	3.281
13.981	3.241
13.981	3.187
14.013	3.309
14.013	3.078
15.032	3.430
15.987	3.288
16.019	3.498
16.019	3.004
16.943	3.593
16.943	3.694
16.975	3.396
16.975	3.484
17.962	3.092
17.962	3.498
18.981	3.457
19.936	3.505
19.936	3.539
19.936	3.593
19.968	3.444];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'wet weight'};  
temp.tWw  = C2K(38.4);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Fors1976';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

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

%% Discussion
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7WW67'; % Cat of Life
metaData.links.id_ITIS = '179929 '; % ITIS
metaData.links.id_EoL = '1299187'; % Ency of Life
metaData.links.id_Wiki = 'Sorex_cinereus'; % Wikipedia
metaData.links.id_ADW = 'Sorex_cinereus'; % ADW
metaData.links.id_Taxo = '169844'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13700479'; % MSW3
metaData.links.id_AnAge = 'Sorex_cinereus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sorex_cinereus}}';
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
bibkey = 'Fors1976'; type = 'Article'; bib = [ ... 
'author = {Douglas J. Forsyth}, ' ... 
'year = {1976}, ' ...
'title = {A Field Study of Growth and Development of Nestling Masked Shrews (\emph{Sorex cinereus})}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {57(4)}, ' ...
'pages = {708-721}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Sorex_cinereus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Sorex_cinereus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
