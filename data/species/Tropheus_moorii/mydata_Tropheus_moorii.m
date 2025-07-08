function [data, auxData, metaData, txtData, weights] = mydata_Tropheus_moorii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Tropheus_moorii'; 
metaData.species_en = 'Blunthead cichlid'; 

metaData.ecoCode.climate = {'Am','BSk'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 15];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 15];

%% set data
% zero-variate data

data.am = 10*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 14.5;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.1e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8-1.53 mm of Hemichromis_fasciatus: pi/6*0.128^3';
data.Wwp = 3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01514*Lp^2.97, see F1';
data.Wwi = 42.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01514*Li^2.97, see F1';

data.Ri  = 140/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Lethrinops_parvidens';
  
% uni-variate data

% time-length
data.tL_f = [ ... % time (yr), std length (cm)
1.984	7.514
2.021	6.220
2.033	6.520
3.006	6.613
3.006	6.821
3.006	7.029
3.018	6.266
3.018	5.064
3.018	6.890
3.967	7.723
3.992	7.838
4.004	7.630
4.016	6.636
4.016	7.491
4.029	7.329
5.002	7.769
5.064	7.908
6.000	7.329
6.000	7.399
6.025	7.561
6.049	7.908
6.049	8.231
8.021	7.931
8.057	7.723
10.053	7.676];
data.tL_f(:,1) = (data.tL_f(:,1) + 0.3)*365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-8;end;end
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'std length','females'};  
temp.tL_f    = C2K(25);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'EggeMeek2004';
%
data.tL_m = [ ... % time (yr), std length (cm)
1.996	7.214
1.996	6.358
1.996	6.312
1.996	6.220
1.996	5.803
2.008	7.006
2.033	7.723
2.033	6.543
2.982	8.023
3.031	8.324
3.992	8.532
4.004	7.977
4.004	7.815
4.004	7.723
4.016	7.514
4.990	8.578
4.990	8.324
5.027	8.925
6.000	8.069
6.000	8.301
6.025	9.711
6.049	8.740
7.023	8.347
8.021	8.879
9.006	8.671];
data.tL_m(:,1) = (data.tL_m(:,1) + 0.3)*365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-8;end;end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'std length','females'};  
temp.tL_m    = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'EggeMeek2004';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01514*(TL in cm)^2.97'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'Endemic to Lake Tanganyika'; 
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '7CVBK'; % Cat of Life
metaData.links.id_ITIS = '170040'; % ITIS
metaData.links.id_EoL = '51895681'; % Ency of Life
metaData.links.id_Wiki = 'Tropheus_moorii'; % Wikipedia
metaData.links.id_ADW = 'Tropheus_moorii'; % ADW
metaData.links.id_Taxo = '189629'; % Taxonomicon
metaData.links.id_WoRMS = '1019140'; % WoRMS
metaData.links.id_fishbase = 'Tropheus-moorii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tropheus_moorii}}';
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
bibkey = 'EggeMeek2004'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.0022-1112.2004.00390.x}, ' ...
'author = {Egger, B. and Meekan, M. and Salzburger, W. and Mwape, L. and Makasa, L. and Shapola, R. and Sturmbauer, C.}, ' ...
'year  = {2004}, ' ...
'title = {Validation of the periodicity of increment formation in the otoliths of a cichlid fish from Lake Tanganyika, East Africa}, ' ...  
'journal = {Journal of Fish Biology}, ' ...
'volume = {64(5)}, ' ...
'pages = {1272–1284}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Tropheus-moorii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

