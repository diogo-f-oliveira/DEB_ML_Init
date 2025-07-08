function [data, auxData, metaData, txtData, weights] = mydata_Apodemus_semotus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Muridae';
metaData.species    = 'Apodemus_semotus'; 
metaData.species_en = 'Taiwan field mouse'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';  'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 01 01];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 23;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Data for Apodemus sylvaticus';
data.tx = 21;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Data for Apodemus sylvaticus';
data.tp = 71;    units.tp = 'd';    label.tp = 'time since birth at puberty female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(36.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Data for Apodemus sylvaticus';
data.tpm = 65;    units.tpm = 'd';    label.tpm = 'time since birth at puberty male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36.7);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = 'Data for Apodemus sylvaticus';
data.am = 6.3*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.7);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Data for Apodemus sylvaticus';

data.Ri  = 5.2*3.8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5.2 pups per litter; 3.8 litters per yr; data for Apodemus sylvaticus';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
0.153	2.327
1.448	2.515
3.320	3.448
5.480	4.288
7.354	5.313
9.658	6.247
11.531	7.366
13.691	8.019
15.420	9.045
17.291	9.513
19.450	10.073
23.484	12.125
27.661	13.991
29.247	15.017
31.552	16.136
35.582	17.351
39.616	19.403
44.653	20.711
49.547	22.112
54.580	22.397
59.759	23.054
69.681	23.623
79.887	23.261
89.821	26.436];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(37.8);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'LinNish1993';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
0.296	2.048
3.030	2.703
4.758	3.449
6.775	4.382
8.791	5.315
10.521	6.341
12.537	7.274
14.555	8.393
16.570	8.860
18.298	9.700
20.745	10.447
24.635	12.313
28.526	14.644
30.399	15.484
32.416	16.510
36.450	18.748
40.773	21.079
45.527	23.505
50.852	24.720
55.744	25.749
60.923	26.406
70.997	28.930
80.926	30.988
90.704	31.463];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(36.7);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'LinNish1993';
comment.tW_m = 'Data for males';
  
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

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumend to differ from females by {p_Am} and E_Hp only';
D2 = 'Zero-variate data and body temperature from Apodemus sylvaticus';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = 'FRJG'; % Cat of Life
metaData.links.id_ITIS = '585141'; % ITIS
metaData.links.id_EoL = '1178948'; % Ency of Life
metaData.links.id_Wiki = 'Apodemus_semotus'; % Wikipedia
metaData.links.id_ADW = 'Apodemus_semotus'; % ADW
metaData.links.id_Taxo = '62923'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13001219'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Apodemus_semotus}}';
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
bibkey = 'LinNish1993'; type = 'Article'; bib = [ ... 
'author = {L.-K. Lin and T. Nishino and S. Shiraishit}, ' ... 
'year = {1993}, ' ...
'title = {Postnatal Growth and Development of the {F}ormosan Wood Mouse \emph{Apodemus semotus}}, ' ...
'howpublished = {\url{https://folk.uio.no/atlemy/pdf/art20.pdf}}, ' ...
'journal = {J. Mamm. Soc. Japan}, ' ...
'volume = {18}, ' ...
'number  = {1}, ' ...
'pages = {1--18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Apodemus_sylvaticus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

