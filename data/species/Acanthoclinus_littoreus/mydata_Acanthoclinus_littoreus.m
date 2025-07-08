function [data, auxData, metaData, txtData, weights] = mydata_Acanthoclinus_littoreus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Plesiopidae';
metaData.species    = 'Acanthoclinus_littoreus'; 
metaData.species_en = 'New Zealand rockfish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.3); % K, body temp
metaData.data_0     = {'ah_T'; 'ab_T'; 'aj'; 'am'; 'Lh'; 'Lb'; 'Lj'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 3.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 13];

%% set data
% zero-variate data

data.ab = 15.5;      units.ab = 'd';   label.ab = 'age at birth'; bibkey.ab = 'fishbase';   
  temp.ab = C2K(17.0); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9 * 365;  units.am = 'd';      label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(17.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'Jill1968'; 
  comment.Lp = 'based on LN data; mean Lp: 21.6';
data.Li  = 20;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 10.1;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'Jill1968','fishbase'};
  comment.Wwi = 'based on 0.00457*Lp^3.10, see F1';
data.Wwi = 49;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00457*Li^3.10, see F1';

data.Ri = 17500/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'Jill1968';
  temp.Ri = C2K(23.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '8200 and 17500 eggs per spherical egg mass, assumed: 1 eggmass per seasaon';

% uni-variate data
% time-length 
data.tL_f = [ ... %  time since birth (yr), total length(cm)
0.079	1.533
0.236	3.372
0.427	3.951
0.551	4.904
0.720	4.972
0.900	5.448
1.035	5.857
1.192	7.424
1.395	8.445
1.597	8.717
1.755	9.023
1.890	9.227
2.081	9.976
2.227	10.078
2.418	10.520
2.576	11.133
2.745	11.848
2.902	11.200
3.071	12.289
3.206	12.221
3.408	12.356
3.566	13.105
3.746	13.105
3.926	12.900
4.049	13.956
4.241	13.750
4.443	14.193
4.589	14.806
4.747	14.737
4.916	14.736
5.084	15.519
5.264	15.246
5.411	15.893
5.579	15.620
5.737	15.790
5.917	15.891
6.063	17.526
6.243	17.423
6.400	17.014
6.738	17.285
6.918	16.910
7.064	18.204
7.222	19.737
7.402	17.215
7.593	17.180
7.739	18.475
7.919	16.941
8.088	18.610
8.751	18.437
8.943	18.913
9.584	19.184
9.753	20.001];
data.tL_f(:,1) = (data.tL_f(:,1) + 0.2) * 365; % convert yr to d
units.tL_f = {'d' 'cm'}; label.tL_f = {'time since birth', 'total length','females'};  
temp.tL_f = C2K(17.3); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Jill1968a'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.214	3.406
0.416	4.155
0.551	5.007
0.686	5.143
0.866	5.006
1.057	5.482
1.215	7.185
1.226	7.730
1.417	8.343
1.564	8.376
1.766	8.580
1.912	9.261
2.216	10.691
2.217	10.350
3.262	12.766
4.263	14.432
5.219	15.485];
data.tL_m(:,1) = (data.tL_m(:,1) + 0.2) * 365; % convert yr to d
units.tL_m = {'d' 'cm'}; label.tL_m = {'time since birth', 'total length','males'};  
temp.tL_m = C2K(17.3); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Jill1968a'; 

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00457*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '64DNQ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46580518'; % Ency of Life
metaData.links.id_Wiki = 'Acanthoclinus_littoreus'; % Wikipedia
metaData.links.id_ADW = 'Acanthoclinus_littoreus'; % ADW
metaData.links.id_Taxo = '159881'; % Taxonomicon
metaData.links.id_WoRMS = '279471'; % WoRMS
metaData.links.id_fishbase = 'Acanthoclinus-littoreus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthoclinus_littoreus}}';
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
bibkey = 'Jill1968'; type = 'Article'; bib = [ ... 
'author = {J.B. Jillett}, ' ... 
'year = {1968}, ' ...
'title = {THE BIOLOGY OF \emph{Acanthoclinus quadridactylus} ({B}LOCH AND {S}CHNEIDER) ({T}ELEOSTEI-{B}LENNIOIDEA) {I}. {A}ge, growth and food }, ' ...
'journal = {Aust. J. mar. Freshwat. Res.}, ' ...
'volume = {19}, ' ...
'pages = {1-8}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jill1968a'; type = 'Article'; bib = [ ... 
'author = {J.B. Jillett}, ' ... 
'year = {1968}, ' ...
'title = {THE BIOLOGY OF \emph{Acanthoclinus quadridactylus} ({B}LOCH AND {S}CHNEIDER) ({T}ELEOSTEI-{B}LENNIOIDEA) {II}. {B}reeding and development}, ' ...
'journal = {Aust. J. mar. Freshwat. Res.}, ' ...
'volume = {19}, ' ...
'pages = {9-18}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Acanthoclinus-littoreus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
