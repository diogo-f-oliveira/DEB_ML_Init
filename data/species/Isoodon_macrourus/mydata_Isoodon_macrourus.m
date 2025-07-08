function [data, auxData, metaData, txtData, weights] = mydata_Isoodon_macrourus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Peramelemorphia'; 
metaData.family     = 'Peramelidae';
metaData.species    = 'Isoodon_macrourus'; 
metaData.species_en = 'Northern brown bandicoot';

metaData.ecoCode.climate = {'Am', 'Cfa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf', '0iTh', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi', 'xiHr', 'xiHl', 'xiF'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 'Ww-pX'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 10 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 10 30]; 

%% set data
% zero-variate data

data.tg = 12;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 60;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 122;    units.tp = 'd';    label.tp = 'time since birth at puberty for females';   bibkey.tp = 'AnAge';
  temp.tp = C2K(35.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 200;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';   bibkey.tpm = 'AnAge';
  temp.tpm = C2K(35.9);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 6.8*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.1883; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 1200;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
data.Wwim = 1700; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';     bibkey.Wwim = 'Wiki';

data.Ri  = 4 * 2.7/ 365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 pups per litter, 2.7 litters per yr';
 
% uni-variate data
% time - weight
data.tW = [ ... % time since birth (d),weight (g)
0.822	0.370
1.410	0.745
1.880	0.736
3.054	0.713
5.050	0.675
6.931	1.411
8.927	1.372
13.039	2.451
17.037	4.304
20.095	6.176
20.568	7.325
24.803	9.946
25.962	4.904
25.979	10.695
26.687	11.840
27.975	10.657
27.987	14.518
29.156	12.951
29.286	17.195
32.690	16.743
32.933	19.441
32.943	22.916
35.102	38.318
35.115	42.951
36.001	24.788
36.010	27.876
37.182	27.081
37.190	29.784
38.854	36.702
39.183	28.587
39.606	52.903
39.615	55.992
39.765	27.032
40.006	28.957
41.077	33.956
41.085	36.659
41.096	40.519
44.097	62.855
44.560	60.530
44.577	66.321
45.651	72.092
46.008	73.629
46.017	76.718
46.168	48.143
47.447	84.026
47.546	77.847
47.555	80.935
48.114	71.272
49.368	98.275
49.495	101.747
50.201	62.351
51.136	100.557
51.154	106.734
51.170	112.140
52.827	116.741
53.084	124.458
53.167	152.642
56.907	106.623
59.879	159.076
59.961	187.259
60.103	155.596
60.212	192.660];
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW   = C2K(35.9);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MercLibk1996';

% weight - energy intake
data.WpX = [ ... % weight (g), energy intake (kJ/d)
     8.5  13.12
    12.9  24.92
    19.1  32.34
    35.2  50.39
    47.5  98.01
    80.3 115.69
   112.1 199.98];
units.WpX  = {'g', 'kJ/d'};  label.WpX = {'weight', 'energy intake'};  
temp.WpX   = C2K(35.9);  units.temp.WpX = 'K'; label.temp.WpX = 'temperature';
bibkey.WpX = 'MercLibk1996';
comment.WpX = 'Energy intake in the form of milk that becomes more concentrated during development';

%% set weights for all real data
weights = setweights(data, []);

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

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '6MYH4'; % Cat of Life
metaData.links.id_ITIS = '552657'; % ITIS
metaData.links.id_EoL = '323866'; % Ency of Life
metaData.links.id_Wiki = 'Isoodon_macrourus'; % Wikipedia
metaData.links.id_ADW = 'Isoodon_macrourus'; % ADW
metaData.links.id_Taxo = '60050'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10900016'; % MSW3
metaData.links.id_AnAge = 'Isoodon_macrourus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Isoodon_macrourus}}';
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
bibkey = 'MercLibk1996'; type = 'Article'; bib = [ ... 
'author = {J. C . Merchant and J. A. Libke and K. Newgrain}, ' ... 
'year = {1996}, ' ...
'title = {Milk consumption and estimates of growth energetics in pouch young of the northern brown bandicoot, \emph{Isoodon macrourus} ({P}eramelidae, {M}arsupialia), in captivity}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {238}, ' ...
'pages = {483-494}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Isoodon_macrourus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

