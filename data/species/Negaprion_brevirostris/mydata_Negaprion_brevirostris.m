function [data, auxData, metaData, txtData, weights] = mydata_Negaprion_brevirostris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Negaprion_brevirostris'; 
metaData.species_en = 'Lemon shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MASE','MAW','MPE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biSvm'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 10 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 31];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 31];

%% set data
% zero-variate data

data.ab = 12*30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'ADW';   
  temp.ab = C2K(26); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 30*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'Wiki';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 62.5;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'ADW'; 
  comment.Lb = '60 to 65  cm';
data.Lp  = 239;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase'; 
data.Lpm  = 224; units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'fishbase'; 
data.Li  = 343;  units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'Wiki';
data.Lim  = 310; units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'guess';

data.Wwb = 1.88e3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on 0.00490*Lb^3.11, see F3';
data.Wwp = 122.2e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00490*Lp^3.11, see F3';
data.Wwpm = 99.88e3;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';      bibkey.Wwpm = 'fishbase';
  comment.Wwpm = 'based on 0.00490*Lpm^3.11, see F3';
data.Wwi = 375.8e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'Wiki','fishbase'};
  comment.Wwi = 'based on 0.00490*Lim^3.11, see F3';
data.Wwim = 274.4e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';  bibkey.Wwim = {'guess','fishbase'};
  comment.Wwim = 'based on 0.00490*Lim^3.11, see F3';
 
data.Ri  = 17/365/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 till 17 pups per litter, one litter per 2 yrs';

 % uni-variate data
 
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.019	57.757
0.160	67.396
0.234	60.931
0.341	56.301
0.416	64.573
0.490	64.556
0.491	71.464
0.722	68.187
0.813	77.837
1.077	71.329
1.078	77.776
1.127	75.923
1.152	81.443
1.153	86.048
1.326	77.259
1.343	86.926
1.400	73.557
1.450	89.664
1.549	85.957
2.054	99.196
2.277	100.066
2.319	106.504
3.213	127.942
3.718	140.260];
data.tL_f(:,1) = 365*data.tL_f(:,1); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth','total length','female'};  
temp.tL_f    = C2K(26);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'TavaWeth2020';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.006	62.828
0.010	55.917
0.011	59.601
0.077	59.586
0.078	62.809
0.143	60.952
0.209	62.318
0.234	65.536
0.250	61.388
0.341	63.669
0.342	69.656
0.408	69.181
0.548	66.846
0.549	71.911
0.598	64.532
0.656	70.044
0.813	70.469
0.995	77.795
1.086	74.551
1.144	70.853
1.218	72.678
1.243	79.120
1.260	82.800
1.261	89.247
1.466	79.989
1.474	75.382
1.499	77.219
1.508	83.664
1.624	85.479
1.723	85.917
1.814	94.646
2.104	93.658
2.112	103.788
2.716	106.412];
data.tL_m(:,1) = 365*data.tL_m(:,1); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth','total length','male'};  
temp.tL_m    = C2K(26);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'TavaWeth2020';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Lb = 3 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 2 * weights.psd.p_M;
weights.psd.kap = 5 * weights.psd.kap;

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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'This entry suggests that the incubation time exceeds a yr, which might be the reason with females skip a year between pregnancies';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Ovoviparity (aplacental viviparity)';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Preferred temp 21.9 - 28 C, usually 0 - 90 m deep';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'Ww (in g) = 0.00490*(TL in cm)^3.11';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '464NF'; % Cat of Life
metaData.links.id_ITIS = '160433'; % ITIS
metaData.links.id_EoL = '46559813'; % Ency of Life
metaData.links.id_Wiki = 'Negaprion_brevirostris'; % Wikipedia
metaData.links.id_ADW = 'Negaprion_brevirostris'; % ADW
metaData.links.id_Taxo = '101350'; % Taxonomicon
metaData.links.id_WoRMS = '105800'; % WoRMS
metaData.links.id_fishbase = 'Negaprion-brevirostris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Negaprion_brevirostris}}';
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
bibkey = 'TavaWeth2020'; type = 'Article'; bib = [ ... 
'doi = {10.1071/MF20070}, ' ...
'author = {Rafael Tavares and Bradley M. Wetherbee and Jon Paul Rodriguez}, ' ... 
'year = {2020}, ' ...
'title = {Age and growth of juvenile lemon sharks (\emph{Negaprion brevirostris}) at an insular nursery in the southern {C}aribbean}, ' ...
'journal = {Marine and Freshwater Research}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Negaprion-brevirostris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Negaprion_brevirostris/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

