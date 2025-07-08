function [data, auxData, metaData, txtData, weights] = mydata_Triops_granarius

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Notostraca'; 
metaData.family     = 'Triopsidae';
metaData.species    = 'Triops_granarius'; 
metaData.species_en = 'Tadpole shrimp'; 

metaData.ecoCode.climate = {'A','B','C'};
metaData.ecoCode.ecozone = {'TH','TP'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD','biHa','biCi'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi';'Ri_L'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator   = {'Dina Lika'};
metaData.email_cur = {'lika@uoc.gr'}; 
metaData.date_acc  = [2024 01 31]; 

%% set data
% zero-variate data

data.tp = 6; units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'Taka1977';   
  temp.tp = C2K(21);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on Lp and tL data';
data.am = 30;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Taka1977';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Wiki gives 90 d';
  
data.Lb  = 0.057;  units.Lb  = 'cm';  label.Lb  = 'carapace length at birth'; bibkey.Lb  = 'Taka1977';
data.Lp  = 0.4;  units.Lp  = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'Taka1977';
data.Li  = 2.3; units.Li  = 'cm';  label.Li  = 'ultimate carapace length';     bibkey.Li  = 'Taka1977';

data.Wwi = 0.227;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Triops_longicaudatus: (2.3/3.1)^3*0.555';

data.R097 = 246;  units.R097 = '#/d';    label.R097 = 'reproduction rate at 0.97 cm';  bibkey.R097 = 'Taka1977';   
  temp.R097 = C2K(21);  units.temp.R097 = 'K'; label.temp.R097 = 'temperature'; 
data.R132 = 430;  units.R132 = '#/d';    label.R132 = 'reproduction rate at 1.32 cm';  bibkey.R132 = 'Taka1977';   
  temp.R132 = C2K(21);  units.temp.R132 = 'K'; label.temp.R132 = 'temperature'; 

% uni-variate data
% time-length
data.tL = [ ... % time after hydration (d), carapace length (cm)
3.762	0.057
5.857	0.137
6.804	0.205
9.052	0.305
9.988	0.389
11.266	0.457
13.850	0.549
16.252	0.665
16.890	0.701
18.807	0.801
22.091	0.833]; 
data.tL(:,1) = data.tL(:,1) - 3.762; % set origin at hatch
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL    = C2K(21);  units.temp.tL = {'d','C'}; label.temp.tL = {'time','temperature'};
bibkey.tL = 'Taka1977';
%
data.tL1 = [ ... % time after hydration (d), carapace length (cm)
16.774	0.720
17.258	0.548
17.258	0.918
17.258	1.101
29.032	1.016
29.032	1.085
29.516	1.225
29.516	1.225
29.677	0.849
29.677	0.946
29.677	1.150
29.677	1.182
29.839	1.010
29.839	1.043
29.839	1.080
30.000	1.311
30.000	1.681
30.161	0.796
30.161	1.359
30.161	1.418
30.323	0.742
30.323	0.764
30.323	1.241
30.323	1.471
30.484	1.021
30.484	1.128
30.645	1.198
30.806	1.337
36.452	1.209
36.613	1.306
36.935	1.263
36.935	1.381
37.097	1.140
37.419	1.295
37.742	1.317
39.194	1.177
39.839	1.059
39.839	1.118
39.839	1.735
40.000	1.022
40.000	1.703
40.000	1.901
40.323	1.161
40.323	1.338
40.323	1.451
40.484	0.979
40.806	1.193
47.742	1.564
47.903	1.473
47.903	1.500
47.903	1.526
47.903	1.870
48.065	1.602
48.065	1.730
48.226	1.387
49.839	1.419
50.484	2.074
50.968	0.990
50.968	1.366
51.129	1.393
51.129	1.425
51.129	1.478
51.290	1.151
51.290	1.205
58.226	1.758
58.871	1.565
59.032	1.726
59.355	1.763
59.677	1.468
60.000	1.436
60.000	1.468
60.323	0.970
60.323	1.495
60.484	1.345
60.484	1.586
61.452	2.273
65.806	1.614
67.419	1.764
67.581	1.748
68.226	1.710
68.226	1.855
70.000	1.475
70.161	1.426
70.645	1.646
78.871	1.947
81.774	1.647];
data.tL1(:,1) = data.tL1(:,1) - 3.762; % set origin at hatch
units.tL1   = {'d', 'cm'};  label.tL1 = {'time since birth', 'carapace length'};  
temp.tL1    = C2K(21);  units.temp.tL1 = {'d','C'}; label.temp.tL1 = {'time','temperature'};
bibkey.tL1 = 'Taka1977';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Lp = 3 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data from the same experiment'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

% %% Discussion points
% D2 = '';
% metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'commonly parthenogenetic; dry egg may be in diapauze till 20 yr';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '58WLP'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '51580822'; % Ency of Life
metaData.links.id_Wiki = 'Triops_granarius'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5716729'; % Taxonomicon
metaData.links.id_WoRMS = '1561236'; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Taka1977'; type = 'Article'; bib = [ ... 
'author = {Fumiki Takahashi}, ' ... 
'year = {1977}, ' ...
'title = {Pioneer life of the tadpole shrimps, \emph{Triops} spp. ({N}otostraca: {T}riopsidae)}, ' ...
'journal = {Appl. Ent. Zool.}, ' ...
'volume = {12(2)}, ' ...
'pages = {104-117}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
