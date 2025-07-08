function [data, auxData, metaData, txtData, weights] = mydata_Leopardus_wiedii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Leopardus_wiedii'; 
metaData.species_en = 'Margay'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvm', 'xiCvb'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc  = [2018 08 08];              

%% set data
% zero-variate data

data.tg = 81;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 56;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '7 till 10 mnth';
data.tp = 659;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.4); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 24*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.4); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Based on Lynx lynx';

data.Wwb = 100; units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'EdwaHawe1997';
data.Wwi = 4e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'EoL';
  comment.Wwi = '3 till 5 kg';
data.Wwim = 6e3;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';     bibkey.Wwim = 'EoL';
  comment.Wwim = '3 till 7 kg';

data.Ri  = 1.5/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 till 2 pups per litter; 1 litter per yr; 2 teats';

  % uni-variate data
% t-W data

data.tW = [ ... % time since birth (d), wet weight (10 g)
0.000	9.205
0.013	10.679
0.924	9.934
1.028	11.961
1.685	10.664
1.840	12.875
2.902	11.391
2.955	13.234
4.017	11.934
4.022	15.621
4.728	12.665
4.883	15.060
5.895	14.683
5.898	16.895
6.858	14.859
6.912	17.623
7.873	16.324
7.927	18.720
8.736	17.791
8.739	19.450
9.701	19.073
9.754	21.469
10.563	19.803
10.718	22.382
11.780	20.530
11.783	22.742
12.592	21.997
12.645	23.840
13.607	23.463
13.711	25.121
14.621	23.638
14.777	27.139
15.535	25.105
15.640	28.606
16.601	26.939
16.605	30.073
17.463	27.853
17.520	32.277
18.427	28.766
18.483	32.821
19.492	29.679
19.649	33.917
20.507	30.960
20.717	36.488
21.370	32.611
21.478	37.403
22.386	34.815
22.492	38.500
23.350	35.912
23.507	39.782
24.365	37.193
24.369	40.327
25.379	37.738
25.487	42.529
26.193	40.311
26.247	42.523
27.208	41.592
27.365	45.278
28.373	41.398
28.429	45.637
29.338	43.233
29.343	46.919
30.200	43.963
30.307	48.570
31.266	45.243
31.271	49.299
32.177	44.867
32.182	48.922
33.192	46.333
33.198	50.941
34.165	54.250
34.209	49.273
35.122	49.818
35.332	55.715
36.033	49.441
36.245	56.260
36.999	51.829
37.056	56.806
38.014	53.111
38.275	59.376
38.978	54.208
39.238	59.183
40.043	54.936
40.048	58.807
40.905	55.481
41.012	59.904];
data.tW(:,2) = data.tW(:,2) * 10; % convert 10 g to g
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight', 'EdwaHawe1997'};  
temp.tW    = C2K(38.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'EdwaHawe1997';

% time-weight data
data.tW1 = [ ... % time since birth (d), wet weight (g)
    0  99
    7 161
   14 237
   21 334
   28 425
   35 511];
units.tW1   = {'d', 'g'};  label.tW1 = {'time since birth', 'wet weight', 'Andr2003'};  
temp.tW1    = C2K(38.4);  units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'Andr2003';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW','tW1'}; subtitle1 = {'Data from EdwaHawe1997, Andr2003'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3T78F'; % Cat of Life
metaData.links.id_ITIS = '552469'; % ITIS
metaData.links.id_EoL = '311954'; % Ency of Life
metaData.links.id_Wiki = 'Leopardus_wiedii'; % Wikipedia
metaData.links.id_ADW = 'Leopardus_wiedii'; % ADW
metaData.links.id_Taxo = '168445'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000119'; % MSW3
metaData.links.id_AnAge = 'Leopardus_wiedii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Leopardus_wiedii}}';
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
bibkey = 'EdwaHawe1997'; type = 'article'; bib = [ ... 
'author = {M. S. Edwards and J. Hawes}, ' ... 
'year = {1997}, ' ...
'title = {An overview of small felid hand-rearing techniques and a case study for {M}exican margay \emph{Leopardus wiedii glaucula} at the {Z}oological {S}ociety of {S}an {D}iego}, ' ...
'journal = {Int. Zoo Yb.}, ' ...
'volume = {35}, '...
'pages = {90-94}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Leopardus_wiedii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/311954/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Andr2003'; type = 'techreport'; bib = [ ... 
'author = {Andrews, P.}, ' ... 
'year = {2003}, ' ...
'title = {Hand-Rearing of SmallFelids}, ' ...
'institution = {Hexagon Farm Wild Feline Breeding Facility}, ' ...
'howpublished = {\url{https://aszk.org.au/wp-content/uploads/2020/05/Hand-RearingSmallFelidsPennyAndrewsHexagonFarms.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

