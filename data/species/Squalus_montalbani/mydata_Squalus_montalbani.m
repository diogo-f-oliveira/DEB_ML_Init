function [data, auxData, metaData, txtData, weights] = mydata_Squalus_montalbani
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Squalidae';
metaData.species    = 'Squalus_montalbani'; 
metaData.species_en = 'Indonesian greeneye spurdog'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW', 'MINE'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(8.6); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 08];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 11 08]; 

%% set data
% zero-variate data;
data.ab = 1.9*365;units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(8.6); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 28*365; units.am = 'd';    label.am = 'life span';             bibkey.am = 'Rigb2015';   
  temp.am = C2K(8.6);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 26;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Rigb2015';
  comment.Lb = 'based on extrapolated tL data';
data.Lp  = 78;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'Rigb2015';
  comment.Lp = 'based on tp 26 yr and tL data';
data.Lpm  = 70;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'Rigb2015';
  comment.Lpm = 'based on tp 21.8 yr and tL data';
data.Li  = 94.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';
 
data.Wwi = 4.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00331*Li^3.09, see F1';

data.Ri  = 12/365/2; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Rigb2015';   
  temp.Ri = C2K(8.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '9-16 pups per litter, 1 litter per 2 yrs assumed, in view of ab';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), total length (cm)
3.178	34.978
6.907	44.615
8.898	47.373
10.975	49.521
16.017	65.119
16.144	61.761
18.136	67.725
18.136	64.367
19.068	68.341
21.992	76.447
22.076	72.173
22.881	70.345
23.136	76.606
23.898	80.121
23.941	77.984
24.025	75.389
24.915	80.737
25.932	78.757
26.059	81.812
26.992	83.038
27.034	85.481
27.034	84.259];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};
temp.tL_f = C2K(8.6);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Rigb2015';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
5.000	37.124
9.110	42.183
14.025	57.018
14.068	54.880
15.000	58.244
15.932	61.302
16.017	59.165
16.017	58.860
17.161	67.720
18.051	69.862
18.051	69.252
19.068	70.631
19.068	66.203
20.042	71.552
21.059	68.962
21.102	74.305
21.102	73.542
21.144	70.031
21.186	72.321
22.034	71.715
22.119	76.601
22.161	73.242
22.161	75.074
23.008	73.094
23.008	74.773
23.008	77.369
23.093	71.109
24.025	75.084
24.025	77.832
24.958	78.142
25.000	79.821
27.034	83.343
28.008	86.860];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};
temp.tL_m = C2K(8.6);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Rigb2015';
comment.tL_m = 'data for males';

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

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'Temperatures are guessed';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length - weight: Ww in g = 0.00331 * (TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6ZFND'; % Cat of Life
metaData.links.id_ITIS = '846114'; % ITIS
metaData.links.id_EoL = '46560214'; % Ency of Life
metaData.links.id_Wiki = 'Squalus_montalbani'; % Wikipedia
metaData.links.id_ADW = 'Squalus_montalbani'; % ADW
metaData.links.id_Taxo = '592299'; % Taxonomicon
metaData.links.id_WoRMS = '299184'; % WoRMS
metaData.links.id_fishbase = 'Squalus-montalbani'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Squalus_montalbani}}';   
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
bibkey = 'Rigb2015'; type = 'phdthesis'; bib = [ ...  
'author = {Rigby, Cassandra Louise}, ' ...
'year = {2015}, ' ...
'title  = {Life history of deepwater chondrichthyans}, ' ...
'school = {James Cook University}, ' ...
'howpublished = {\url{http://researchonline.jcu.edu.au/46298/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Squalus-montalbani.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];