function [data, auxData, metaData, txtData, weights] = mydata_Glyptemys_muhlenbergii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Glyptemys_muhlenbergii'; 
metaData.species_en = 'Bog turtle';

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bFm', 'biTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 55;     units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'ADW';   
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '45-65 d';
data.tp = 6.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'LoviErns1998';
  temp.tp = C2K(22);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tL and Lp data';
data.am = 40*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 2.5; units.Lb = 'cm';   label.Lb = 'carapace length at birth';      bibkey.Lb = 'ADW';
  comment.Lb = '2.11-2.85 cm';
data.Lp = 7; units.Lp = 'cm';   label.Lp = 'carapace length at puberty';      bibkey.Lp = 'LoviErns1998';
data.Li = 9.19; units.Li = 'cm';   label.Li = 'ultimate carapace length';      bibkey.Li = 'LoviErns1998';
data.Lim = 9.76; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';      bibkey.Lim = 'LoviErns1998';

data.Wwi = 247; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'EoL';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 eggs per clutch, 1 clutch per yr';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), carapace length (cm)
0.974	2.471
0.975	2.543
0.976	2.614
0.979	2.780
1.889	3.945
1.932	3.850
1.973	3.564
2.013	3.279
2.014	3.374
2.881	4.610
4.050	5.133
5.006	6.392
5.092	6.154
5.943	6.368
7.945	8.887
8.971	8.840
9.942	8.103
9.965	9.671
10.014	9.909
10.978	8.697
10.982	9.006
11.024	8.816
11.106	8.293
11.785	8.958
11.876	9.053
11.877	9.149
11.878	9.196
11.879	9.267
12.016	9.457
12.044	8.364
12.956	9.624
12.994	9.172
12.996	9.315
12.997	9.410
13.115	8.317
14.018	9.006
14.019	9.077
14.020	9.125
14.021	9.220
14.070	9.505
14.075	9.861
15.045	9.053
15.047	9.172
15.050	9.362
15.055	9.695
15.987	9.339
16.119	9.172
16.877	9.125
17.065	9.766
17.993	9.101
17.995	9.244
17.999	9.529
18.002	9.719
18.004	9.838
18.891	9.505
19.021	9.244
19.915	9.267
19.917	9.434
20.015	9.980
20.017	10.123
20.954	10.099
20.961	10.550
20.976	8.578
20.989	9.481
22.917	10.051
22.918	10.123
23.971	8.863
25.026	7.747
27.012	9.220
27.097	8.935
30.088	8.887
30.988	9.362
31.963	8.887];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LoviErns1998';
comment.tL_f = 'Data for females from Pennsylvania';
%
data.tL_m = [ ... % time since birth (yr), carapace length (cm)
8.015	7.604
8.017	7.723
8.019	7.889
8.036	9.006
8.037	9.101
8.039	9.244
8.854	6.986
8.975	9.125
9.001	7.889
9.021	9.244
9.060	8.816
9.983	7.842
9.995	8.650
10.005	9.339
11.024	8.840
11.027	8.982
11.032	9.339
11.063	8.412
11.887	9.838
11.889	9.933
11.971	9.457
11.973	9.552
12.005	8.721
12.906	9.291
13.003	9.814
14.067	9.315
14.964	9.552
15.057	9.838
15.104	9.956
15.136	9.149
15.984	9.125
15.987	9.339
15.990	9.505
16.925	9.386
17.017	9.529
17.950	9.220
17.955	9.552
17.961	9.956
18.980	9.434
18.987	9.909
20.054	9.624
20.066	10.408
21.036	9.600
22.033	10.646
22.112	9.933
22.925	10.527
22.971	10.622
23.011	10.313
24.032	9.933
24.042	10.646
24.124	10.123
24.928	10.194
24.959	9.267
25.998	10.051
30.115	10.717];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LoviErns1998';
comment.tL_m = 'Data for males from Pennsylvania';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';

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

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';   
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Temperatures < 22.5-27 C give males > 30 C females';
metaData.bibkey.F1 = 'ADW';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3GHJS'; % Cat of Life
metaData.links.id_ITIS = '668670'; % ITIS
metaData.links.id_EoL = '1056842'; % Ency of Life
metaData.links.id_Wiki = 'Glyptemys_muhlenbergii'; % Wikipedia
metaData.links.id_ADW = 'Glyptemys_muhlenbergii'; % ADW
metaData.links.id_Taxo = '640664'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Glyptemys&species=muhlenbergii'; % ReptileDB
metaData.links.id_AnAge = 'Glyptemys_muhlenbergii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Glyptemys_muhlenbergii}}';
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
bibkey = 'LoviErns1998'; type = 'Article'; bib = [ ... 
'author = {Jeffrey E. Lovich and Carl H. Ernst and Robert T. Zappalort and Dennis W. Harman}, ' ... 
'year = {1998}, ' ...
'title = {Geographic Variation in Growth and Sexual Size Dimorphism of Bog Turtles (\emph{Clemmys muhlenbergii}) }, ' ...
'journal = {Am. Midl. Nat.}, ' ...
'volume = {139)}, ' ...
'pages = {69-78}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Glyptemys_muhlenbergii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1056842}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Glyptemys_muhlenbergii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

