function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_obsoletus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_obsoletus'; 
metaData.species_en = 'Orange-striped emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 21];

%% set data
% zero-variate data

data.am = 22*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'EbisOzaw2009';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 23.7; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 60;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'GomaSiju2021';
  comment.Wwb = 'based egg diameter of 0.7 mm of Lethrinus_lentjan: pi/6*0.07^3'; 
data.Wwp = 145.5;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01202*Lp^2.97, see F1';
data.Wwi = 2296;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^2.97, see F1';

data.GSI = 0.13; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'Ebis2006';
  temp.GSI = C2K(28.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
1.659	20.919
1.818	21.861
2.018	22.117
2.098	22.803
2.099	21.773
2.136	24.518
2.179	21.344
2.257	23.488
2.299	22.201
2.376	24.945
2.538	23.314
2.615	25.887
2.697	24.685
2.738	23.570
2.855	26.314
2.894	27.343
2.898	23.740
2.976	25.627
2.978	24.168
3.017	24.511
3.055	26.655
3.098	23.738
3.134	27.513
3.176	26.397
3.177	25.025
3.294	27.597
3.337	25.109
3.338	24.165
3.418	24.937
3.495	27.167
3.496	26.137
3.577	25.536
3.658	24.849
3.777	26.307
3.779	24.419
3.814	28.623
3.815	27.765
3.856	27.335
3.856	26.649
3.978	25.619
4.017	26.734
4.017	26.391
4.095	28.191
4.178	25.531
4.216	27.933
4.297	27.160
4.417	27.159
4.496	28.188
4.538	26.301
4.579	25.786
4.617	27.673
4.696	28.701
4.698	26.385
4.738	26.985
4.777	27.671
4.817	27.757
4.896	29.129
5.017	28.098
5.059	26.468
5.098	27.154
5.218	27.668
5.256	29.298
5.339	27.152
5.458	28.267
5.498	27.666
5.537	28.866
5.579	27.150
5.656	30.238
5.697	28.779
5.898	28.177
5.938	28.606
5.977	29.463
6.018	28.348
6.021	26.461
6.220	27.403
6.256	30.662
6.299	28.260
6.539	28.258
6.619	28.686
6.777	30.401
6.858	29.714
6.861	27.827
6.899	29.027
7.060	28.426
7.179	29.454
7.181	28.167
7.299	30.311
7.301	27.737
7.500	29.537
7.501	28.851
7.542	27.478
7.621	28.679
7.701	29.193
7.738	31.509
7.942	28.676
7.980	29.791
8.138	32.363
8.139	31.334
8.140	30.133
8.261	29.360
8.303	27.987
8.502	28.929
8.541	29.787
8.623	28.585
8.903	29.098
9.062	29.697
9.064	28.410
9.383	29.523
9.421	31.410
9.422	30.552
9.943	30.719
10.104	29.689
10.183	30.889
10.344	29.944
10.385	29.515
10.422	32.603
10.584	30.629
10.627	28.312
10.628	27.368
10.705	30.113
10.786	29.083
10.822	32.514
10.903	31.913
11.147	29.423
11.183	32.597
11.265	30.966
11.344	31.652
11.346	30.537
11.387	29.679
11.705	31.563
11.746	30.619
12.027	30.274
12.228	29.929
12.387	31.215
12.388	30.443
12.468	30.013
12.669	29.411
12.671	28.382
12.788	30.697
12.789	29.582
12.829	30.354
12.830	28.981
12.988	31.296
13.069	30.609
13.108	31.295
13.185	33.696
13.389	30.950
13.591	29.833
13.668	31.977
14.148	33.260
14.470	31.370
14.750	32.226
14.992	30.508
15.030	32.996
15.031	31.709
15.072	31.108
16.471	33.842
16.554	31.869
17.115	31.264
19.199	31.248
19.597	33.646
20.038	33.300
21.161	33.120];
data.tL_f(:,1) = 365 * (0+data.tL_f(:,1));  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length','females'};  
temp.tL_f    = C2K(28.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'EbisOzaw2009';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
1.341	18.777
1.779	21.004
2.136	24.346
2.138	22.288
2.300	21.085
2.498	23.314
2.775	26.229
2.939	23.311
3.059	22.967
3.140	22.709
3.297	25.024
3.538	25.193
3.579	24.335
3.898	25.619
4.140	24.417
4.213	30.421
4.218	25.617
4.259	24.759
4.339	25.444
4.695	28.873
4.977	28.270
5.055	29.814
5.179	26.896
5.534	31.183
5.620	26.464
5.979	27.405
6.018	29.120
6.175	31.950
6.259	28.175
6.819	29.285
7.222	27.481
7.940	29.963
8.263	28.330
8.383	28.072
8.622	29.014
9.183	29.438
9.184	28.924
9.581	32.095
10.023	31.148
10.466	29.000
10.625	29.599
10.784	31.313
10.825	30.541
11.823	33.364
11.950	27.701
12.065	32.161
12.069	28.815
12.748	31.126
12.869	29.667
13.870	31.118
14.069	31.545
15.310	33.079
15.873	31.617
16.955	31.522
16.996	30.321
17.996	32.115];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));  % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length','males'};  
temp.tL_m    = C2K(28.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'EbisOzaw2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww ing g = 0.01202*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'protogynous hermaphrodite';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '722Q6'; % Cat of Life
metaData.links.id_ITIS = '550907'; % ITIS
metaData.links.id_EoL = '46580956'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus_obsoletus'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_obsoletus'; % ADW
metaData.links.id_Taxo = '178746'; % Taxonomicon
metaData.links.id_WoRMS = '212085'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-obsoletus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus_obsoletus}}';
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
bibkey = 'EbisOzaw2009'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s12562-009-0061-9}, ' ...
'author = {Akihiko Ebisawa and Takakazu Ozawa}, ' ... 
'year = {2009}, ' ...
'title = {Life-history traits of eight \emph{Lethrinus} species from two local populations in waters off the {R}yukyu {I}slands}, ' ...
'journal = {Fish Sci}, ' ...
'volume = {75}, ' ...
'pages = {553–566}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GomaSiju2021'; type = 'Article'; bib = [ ... 
'doi = {10.1111/are.15461}, ' ...
'author = {Pitchaimuthu Gomathi and Ramachandran Siju and Mathavankonathu Kuttan Anil and Gopidas P. Ambarish and Sumathi Surya and Bhargavan Raju and Padikkala Kandiyil Raheem and Boby Ignatius and Achamveettil Gopalakrishnan}, ' ... 
'year = {2021}, ' ...
'title = {Embryonic and larval development of Pink ear emperor, \emph{Lethrinus lentjan} ({L}acepede, 1802) under captive conditions}, ' ...
'journal = {Aquaculture Research}, ' ...
'volume = {52}, ' ...
'pages = {5857–5869}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DegoAli2013'; type = 'Article'; bib = [ ... 
'author = {A. S. O. Abu Degoon and S. M. Ali}, ' ... 
'year = {2013}, ' ...
'title = {On some reproductive aspects of the Sky Emperor, \emph{Lethrinus mahsena} ({P}ieces) in the {S}udanese {R}ed {S}ea}, ' ...
'journal = {SJBS (B)}, ' ...
'volume = {17}, ' ...
'pages = {51-62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Ebis2006'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10228-006-0345-3}, ' ...
'author = {Akihiko Ebisawa}, ' ... 
'year = {2006}, ' ...
'title = {Reproductive and sexual characteristics in five Lethrinus species in waters off the {R}yukyu {I}slands}, ' ...
'journal = {Ichthyol Res}, ' ...
'volume = {53}, ' ...
'pages = {269–280}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus-obsoletus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
