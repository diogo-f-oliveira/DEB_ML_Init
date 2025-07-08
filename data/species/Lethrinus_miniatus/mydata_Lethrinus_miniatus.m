function [data, auxData, metaData, txtData, weights] = mydata_Lethrinus_miniatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Lethrinidae';
metaData.species    = 'Lethrinus_miniatus'; 
metaData.species_en = 'Trumpet emperor'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
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

data.am = 26*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'EbisOzaw2009';   
  temp.am = C2K(28.4);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp  = 36.1; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 90;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'GomaSiju2021';
  comment.Wwb = 'based egg diameter of 0.7 mm of Lethrinus_lentjan: pi/6*0.07^3'; 
data.Wwp = 251.2;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01413*Lp^3.00, see F1';
data.Wwi = 10301;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01413*Li^3.00, see F1';

data.GSI = 0.08; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'Ebis2006';
  temp.GSI = C2K(28.4); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), fork length (cm)
1.683	26.600
1.867	24.871
1.911	22.281
1.959	24.583
1.960	26.885
2.008	28.323
2.050	23.718
2.098	25.157
2.099	26.308
2.101	29.761
2.142	22.422
2.238	27.457
2.240	30.047
2.286	29.615
2.335	33.212
2.335	34.075
2.470	28.894
2.471	30.764
2.564	31.482
2.565	32.202
2.887	30.616
2.887	31.335
2.887	31.335
2.893	38.241
3.073	31.908
3.074	34.211
3.078	39.534
3.165	32.051
3.166	33.058
3.261	36.367
3.261	36.942
3.352	35.502
3.353	36.222
3.396	32.193
3.396	32.624
3.398	34.783
3.402	39.818
3.403	40.538
3.493	38.235
3.493	38.666
3.538	36.651
3.539	37.659
3.585	37.083
3.587	40.680
3.814	34.634
3.908	37.511
3.910	39.525
3.911	40.676
3.912	42.834
3.956	39.093
3.958	41.971
4.048	39.380
4.091	35.494
4.142	41.537
4.188	41.249
4.511	40.957
4.560	44.266
4.789	42.393
4.879	38.939
4.926	39.802
5.020	41.671
5.021	43.398
5.111	40.231
5.202	38.504
5.345	43.826
5.760	43.533
5.809	46.986
5.945	43.819
5.946	44.682
6.039	45.832
6.129	43.385
6.179	48.421
6.223	45.255
6.270	46.118
6.315	44.534
6.406	42.375
6.449	38.921
6.451	41.367
6.452	42.662
6.456	47.698
6.685	44.818
6.685	45.106
6.686	46.976
6.776	42.803
6.778	46.544
6.916	45.967
7.098	42.224
7.103	47.979
7.150	49.129
7.286	45.675
7.290	51.286
7.425	46.393
7.425	46.968
7.798	51.856
7.887	47.395
8.028	50.415
8.071	46.242
8.116	44.083
8.118	46.817
8.442	48.396
8.859	50.262
9.183	50.402
11.168	49.085
12.095	53.823
15.004	53.215];
data.tL_f(:,1) = 365 * (0+data.tL_f(:,1));  % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1);data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length','females'};  
temp.tL_f    = C2K(28.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'EbisOzaw2009';
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
1.914	26.310
2.099	27.459
2.520	33.353
2.565	32.490
2.565	32.490
2.845	35.940
3.354	37.085
3.356	39.819
3.585	38.234
3.588	41.111
3.863	38.950
3.913	43.985
4.098	43.983
4.373	41.966
5.347	46.560
6.688	49.278
6.828	50.572
6.966	49.707
7.660	51.858
7.936	49.984
8.030	52.573
8.076	51.997
8.348	45.807
8.814	51.269
8.907	52.276
9.183	50.402
9.877	52.553
10.203	56.146
10.710	54.702
11.079	53.834
11.123	50.956
11.170	52.826
11.262	51.962
11.774	57.568
12.141	53.247
12.277	51.087
12.969	50.216
13.065	54.244
14.729	56.240
15.609	58.964
16.347	57.805
16.530	56.220
16.946	56.647
17.546	55.777
18.146	56.202
24.197	57.430];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));  % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1);data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length','males'};  
temp.tL_m    = C2K(28.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'EbisOzaw2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
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
F1 = 'length-weight: Ww ing g = 0.01413*(TL in cm)^3.00';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'protogynous hermaphrodite';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '72329'; % Cat of Life
metaData.links.id_ITIS = '169131'; % ITIS
metaData.links.id_EoL = '46580939'; % Ency of Life
metaData.links.id_Wiki = 'Lethrinus_miniatus'; % Wikipedia
metaData.links.id_ADW = 'Lethrinus_miniatus'; % ADW
metaData.links.id_Taxo = '178745'; % Taxonomicon
metaData.links.id_WoRMS = '212062'; % WoRMS
metaData.links.id_fishbase = 'Lethrinus-miniatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lethrinus_miniatus}}';
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
'howpublished = {\url{http://www.fishbase.org/summary/Lethrinus-miniatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
