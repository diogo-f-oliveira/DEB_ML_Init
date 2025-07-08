function [data, auxData, metaData, txtData, weights] = mydata_Microtus_guentheri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Cricetidae';
metaData.species    = 'Microtus_guentheri'; 
metaData.species_en = 'Guenther''s vole'; 

metaData.ecoCode.climate = {'BSk', 'Csa', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTg', '0iTht', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 01];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 21;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 18;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 60;   units.tp = 'd';     label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.3); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 95;   units.tpm = 'd';     label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.3); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 3.9*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Wwb = 3;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 15;   units.Wwx = 'g';     label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'AnAge';
data.Wwi = 51.9;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 6*3.3/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6 pups per litter; 3.3 litters per yr';

% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
0.784	2.663
1.870	3.306
3.168	3.525
4.037	4.061
5.118	4.279
5.882	5.027
7.073	5.458
8.055	6.421
8.806	5.999
9.896	7.068
10.977	7.179
11.846	7.715
12.714	8.145
13.909	8.895
14.889	9.751
15.865	10.181
16.851	11.569
17.846	13.701
19.024	12.855
19.924	16.264
20.991	15.205
22.091	17.125
22.829	15.533
24.065	20.007
24.902	17.564
26.230	20.655
26.975	19.702
27.969	21.834
28.936	21.413
30.250	23.121
31.116	23.444
31.985	23.981
33.308	26.540
34.137	23.352
34.911	25.058
36.197	24.213
37.171	24.537
38.146	24.861
39.272	29.228
40.193	24.551
41.284	25.620
42.373	26.583
43.274	30.098
44.204	26.272
45.287	26.597];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(38.3);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'CoheHell1983';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
0.942	2.827
2.016	3.390
2.946	3.670
3.948	4.233
4.949	4.442
6.025	5.358
7.024	5.214
7.959	6.484
9.031	6.481
9.964	7.539
10.892	7.466
11.970	8.665
12.968	8.450
13.976	10.074
14.976	9.929
16.053	11.200
16.915	12.258
17.923	13.882
18.923	13.879
19.936	16.635
20.933	15.995
22.011	17.478
22.936	16.555
23.947	19.028
24.947	19.025
25.955	20.579
26.953	20.293
27.893	22.554
28.958	21.206
29.966	22.972
30.967	23.110
31.904	24.876
32.984	26.712
33.966	22.959
34.982	26.352
35.980	25.854
36.994	28.752
37.904	24.928
38.995	29.028
40.045	24.497
40.979	25.626
42.047	24.986
42.992	28.308
43.980	25.829
44.979	25.613];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(38.3);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'CoheHell1983';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;
weights.tW_f = 10 * weights.tW_f;
weights.tW_m = 10 * weights.tW_m;

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
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumend to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '7VV7S'; % Cat of Life
metaData.links.id_ITIS = '632866'; % ITIS
metaData.links.id_EoL = '1179644'; % Ency of Life
metaData.links.id_Wiki = 'Microtus_guentheri'; % Wikipedia
metaData.links.id_ADW = 'Microtus_guentheri'; % ADW
metaData.links.id_Taxo = '62689'; % Taxonomicon
metaData.links.id_MSW3 = '13000266'; % Mammal Spec World
metaData.links.id_AnAge = 'Microtus_guentheri'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Microtus_guentheri}}';
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
bibkey = 'CoheHell1983'; type = 'Article'; bib = [ ... 
'author = {L. Cohen-Shlagman and S. Hellwing and Y. Yom-Tov}, ' ... 
'year = {1983}, ' ...
'title = {The biology of the {L}evant vole, \emph{Microtus guentheri} in {I}srael II. {T}he reproduction and growth in captivity}, ' ...
'howpublished = {\url{https://folk.uio.no/atlemy/pdf/art20.pdf}}, ' ...
'journal = {Zeitschrift f\"{u}r S\"{a}ugetierkunde}, ' ...
'volume = {49}, ' ...
'pages = {148--156}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Microtus_guentheri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

