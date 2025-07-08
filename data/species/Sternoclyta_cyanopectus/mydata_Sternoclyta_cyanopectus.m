function [data, auxData, metaData, txtData, weights] = mydata_Sternoclyta_cyanopectus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Apodiformes'; 
metaData.family     = 'Trochilidae';
metaData.species    = 'Sternoclyta_cyanopectus'; 
metaData.species_en = 'Violet-chested hummingbird'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnpf'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi', 'xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.1); % K, body Temperature 
% 41.5 C (mean - range (40.5-42.5)) bib:A Natural History of the Sonoran Desert 
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_subm = [2018 09 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};    
metaData.date_mod_1    = [2022 11 21];              
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1 = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_2     = [2023 06 30];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 30];

%% set data
% zero-variate data;
data.ab = 20.4;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'FierMart2007';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'egg temperature'; 
data.tx = 26;      units.tx = 'd';    label.tx = 'time since birth at fledging'; bibkey.tx = 'FierMart2007'; 
  temp.tx = C2K(38.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 78;      units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess'; 
  temp.tp = C2K(38.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 365;   units.tR = 'd';   label.tR = 'time since birth at 1st brood'; bibkey.tR = 'FierMart2007';
  temp.tR = C2K(38.1);  units.temp.tR = 'K'; label.temp.tR = 'temperature';  
data.am = 10*365;  units.am = 'd';   label.am = 'life span';                     bibkey.am = 'ADW'; 
  temp.am = C2K(38.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for Archilochus_alexandri';

data.Wwb = 0.33; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'FierMart2007';
data.Wwi = 7.5; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'FierMart2007';   

data.Ri  = 2/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'FierMart2007';   
temp.Ri = C2K(38.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW = [...
0.071	0.671
0.071	0.740
0.072	0.877
0.996	1.429
0.997	1.670
1.028	0.948
1.985	1.018
1.986	1.138
1.986	1.241
2.943	1.449
2.979	1.793
2.983	2.722
3.050	2.396
4.002	1.433
4.002	1.571
4.004	2.018
4.994	1.779
4.994	1.917
4.999	3.086
5.000	3.258
5.001	3.585
5.030	2.209
5.948	1.230
5.987	2.434
6.052	1.591
6.054	2.073
6.087	1.798
6.978	2.625
6.979	2.883
6.980	3.089
6.981	3.244
6.982	3.399
6.988	4.810
6.989	5.033
7.020	4.431
7.999	1.783
8.004	2.884
8.006	3.366
8.008	3.830
8.999	3.918
9.005	5.449
9.036	4.520
9.070	4.675
9.990	4.074
9.990	4.194
9.991	4.298
9.993	4.848
10.026	4.607
10.052	2.629
10.995	7.430
11.018	4.884
11.020	5.297
11.020	5.434
11.024	6.329
11.030	7.654
11.977	5.505
12.013	5.849
12.013	6.055
12.980	8.396
12.981	8.775
13.002	5.609
13.004	6.143
13.042	7.037
13.043	7.140
14.024	5.026
14.026	5.439
14.029	6.075
14.031	6.643
14.035	7.572
16.040	5.166
16.042	5.785
16.051	7.781
16.079	6.388
16.091	9.123
16.091	9.226
17.987	5.324
18.022	5.479
18.026	6.339
18.072	9.212
18.073	9.350
18.987	7.458
18.988	7.871
20.043	6.944
20.053	9.301
20.054	9.387
21.998	8.822
21.999	9.114
22.023	6.809
22.028	7.824
22.060	7.480
22.982	7.326
25.030	7.054
26.123	7.038];
n=size(data.tW,1); for i=2:n; if data.tW(i,1)<=data.tW(i-1,1);data.tW(i,1)=data.tW(i-1,1)+1e-8;end;end
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW   = C2K(38.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'FierMart2007';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = weights.tW * 2;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Body temperatures are guessed';
D2 = 'mod_1: v is reduced';
D3 = 'mod_2: Pseudo-data point k is used, rather than k_J; Data set tp and parameter t_R are added, the latter replacing clutch interval t_N. Postnatal T is based on PrinPres1991, see <a href="https://debtool.debtheory.org/lib/pet/html/get_T_Aves.html">get_T_Aves</a>. See further the <a href="https://debportal.debtheory.org/docs/Revision.html">revision page, theme puberty</a>';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Body temperature drops at night';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '52FKM'; % Cat of Life
metaData.links.id_ITIS = '555208'; % ITIS
metaData.links.id_EoL = '45512348'; % Ency of Life
metaData.links.id_Wiki = 'Sternoclyta_cyanopectus'; % Wikipedia
metaData.links.id_ADW = 'Sternoclyta_cyanopectus'; % ADW
metaData.links.id_Taxo = '72450'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_avibase = 'B1A4A6A075AAE499'; % avibase
metaData.links.id_birdlife = 'violet-chested-hummingbird-sternoclyta-cyanopectus'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sternoclyta_cyanopectus}},'...
'note = {Accessed : 2017-03-20}'];
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
bibkey = 'FierMart2007'; type = 'Article'; bib = [ ... 
'author = {K. Fierro-Caledero and T. E. Martin}, ' ... 
'year = {2007}, ' ...
'title = {REPRODUCTIVE BIOLOGY OF THE VIOLET-CHESTED HUMMINGBIRD IN {V}ENEZUELA AND COMPARISONS WITH OTHER TROPICAL AND TEMPERATE HUMMINGBIRDS}, ' ...
'journal = {The Condor}, ' ...
'volume = {109}, ' ...
'pages = {680-685}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Will2002'; type = 'Book'; bib = [ ...  
'author = {S. Williamson}, ' ...
'year = {2002}, ' ...
'title  = {A Field Guide to Hummingbirds of North America}, ' ...
'publisher = {Houghton Mifflin Company}, ' ...
'pages = {62}, ' ...
'howpublished = {\url{https://books.google.pt/books?id=XtZ1xotyal8C&printsec=frontcover&dq=a+field+of+hummingbirds+of+north+america}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = [ ...
'author = {University of Michigan}, ' ...
'year = {2001}, ' ...
'howpublished = {\url{http://animaldiversity.org/accounts/Archilochus_alexandri/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

