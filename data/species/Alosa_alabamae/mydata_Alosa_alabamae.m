  function [data, auxData, metaData, txtData, weights] = mydata_Alosa_alabamae

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Alosidae';
metaData.species    = 'Alosa_alabamae'; 
metaData.species_en = 'Alabama shad'; 

metaData.ecoCode.climate = {'MB','Cfa'};
metaData.ecoCode.ecozone = {'MAW','THn'};
metaData.ecoCode.habitat = {'piMpe', '0bFr', 'piFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 07 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.am = 4*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 38;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'Ingr2007'; 
  comment.Lp = 'based on tp = 3 yr';
data.Li = 60.7;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  comment.Li = 'based on SL 51 cm: 51/0.84, see F2';

data.Wwb = 5.23e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 1 mm for A.mediocris: pi/6*0.1^3';
  
% uni-variate data
% time - length
data.tL_f = [ ... % time since hatch (yr), total length (cm)
2.000	37.167
3.005	38.630
4.005	41.459];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
  temp.tL_f = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature'; 
bibkey.tL_f = {'Ingr2007'};
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since hatch (yr), total length (cm)
0.986	26.777
1.988	35.046
2.991	36.130];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
  temp.tL_m = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature'; 
bibkey.tL_m = {'Ingr2007'};
comment.tL_m = 'Data for males';

% length - weight
data.LWw_f = [ ...
27.949	221.687
28.636	267.470
29.099	255.422
30.933	368.675
31.219	392.771
32.026	402.410
32.669	315.663
33.757	390.361
34.850	421.687
35.185	534.940
35.239	571.084
35.698	600.000
35.877	532.530
36.454	530.120
36.504	612.048
36.792	619.277
36.959	679.518
37.386	431.325
37.540	628.916
37.649	696.386
37.871	790.361
38.634	648.193
38.964	819.277
38.971	744.578
39.371	785.542
39.599	807.229
40.069	720.482
40.912	956.627
41.477	1077.108
41.710	1048.193
41.713	1016.867
41.788	833.735
41.953	925.301
42.288	1036.145
42.773	785.542
43.046	951.807
43.089	1098.795];
units.LWw_f = {'cm', 'g'};  label.LWw_f = {'total length', 'wet weight', 'female'};  
bibkey.LWw_f = {'Ingr2007'};
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ...
19.026	50.602
20.061	81.928
21.618	81.928
21.673	113.253
21.964	91.566
22.018	125.301
22.769	108.434
23.344	125.301
24.384	113.253
24.837	197.590
25.475	159.036
25.530	187.952
25.767	115.663
26.341	146.988
26.443	289.157
26.914	185.542
27.199	216.867
27.316	202.410
27.320	166.265
27.610	144.578
28.415	171.084
28.980	289.157
29.451	187.952
29.612	320.482
29.962	279.518
30.078	265.060
30.427	233.735
30.534	325.301
30.883	293.976
31.111	320.482
32.208	303.614
33.013	334.940
33.470	375.904
33.655	250.602
33.765	313.253
34.401	296.386
35.132	484.337
36.168	508.434
36.216	607.229
36.286	479.518
37.193	643.373
37.612	489.157
41.278	742.169
41.327	828.916];
units.LWw_m = {'cm', 'g'};  label.LWw_m = {'total length', 'wet weight', 'male'};  
bibkey.LWw_m = {'Ingr2007'};
comment.LWw_m = 'Data for males';

% length - fecundity
data.LN = [ ... % total length (cm), fecumdity (#/1000)
28.711	125.680
31.326	94.218
31.886	30.014
32.670	41.504
33.724	58.736
34.099	25.490
34.721	36.403
35.326	146.512
35.452	65.093
35.749	61.088
35.778	81.731
36.317	69.132
36.561	78.886
36.885	82.336
36.935	51.374
37.070	48.511
37.507	92.102
37.691	50.823
37.748	81.214
38.529	60.021
38.938	100.170
39.236	106.486
39.501	61.769
39.616	130.580
40.030	210.293
41.154	126.610
41.798	93.945
41.857	137.525
41.960	89.362
42.180	125.493
42.348	186.277
42.790	29.753
43.096	116.918
43.236	158.780
43.478	151.906];
data.LN(:,2) = 1e3*data.LN(:,2);
units.LN = {'cm', '#'};  label.LN = {'total length', 'fecundity'};  
  temp.LN = C2K(21);  units.temp.LN = 'K'; label.temp.LN = 'temperature'; 
bibkey.LN = {'Ingr2007'};


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.Li = weights.Li * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = weights.psd.v * 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LWw_f','LWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};


%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.bibkey.D1 = 'Wiki'; 
D2 = 'mean temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g = 0.01110*(TL in cm)^3.000';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.84*TL';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'C5LG'; % Cat of Life
metaData.links.id_ITIS = '161705'; % ITIS
metaData.links.id_EoL = '47229200'; % Ency of Life
metaData.links.id_Wiki = 'Alosa_alabamae'; % Wikipedia
metaData.links.id_ADW = 'Alosa_alabamae'; % ADW
metaData.links.id_Taxo = '42626'; % Taxonomicon
metaData.links.id_WoRMS = '272248'; % WoRMS
metaData.links.id_fishbase = 'Alosa-alabamae'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Alosa_alabamae}}';  
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
bibkey = 'Ingr2007'; type = 'phdthesis'; bib = [ ...  
'author = {Travis Ingram}, ' ...
'year = {2007}, ' ...
'title = {Age, Growth, and Fecundity of {A}labama Shad (\emph{Alosa alabamae}) in the {A}palachicola {R}iver, {F}lorida}, ' ... 
'school = {Clemson University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{www.fishbase.org/summary/1582}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  