function [data, auxData, metaData, txtData, weights] = mydata_Pseudochromis_fuscus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pseudochromidae';
metaData.species    = 'Pseudochromis_fuscus'; 
metaData.species_en = 'Brown dottyback'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MINW','MPSW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 03];

%% set data
% zero-variate data

data.ab = 4;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(28);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ThilMcIl2016';   
  temp.am = C2K(28);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 4.5; units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 10;  units.Li  = 'cm';  label.Li  = 'ultimate standard length for females'; bibkey.Li  = 'fishbase';

data.Wwb = 1.3e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 1.35 mm: pi/6*0.135^3'; 
data.Wwp = 0.53; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00490*Lp^3.11, see F1';
data.Wwi = 6.3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00490*Li^3.11, see F1';

data.Ri = 1200/56; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Pseudochromis_flavivertex';

% uni-variate data
% t-L data 
data.tL = [ ... % time since birth (d), standard length (cm)
0.188	2.321
0.221	2.648
0.269	2.238
0.289	3.495
0.319	2.456
0.339	3.686
0.354	3.194
0.356	3.767
0.486	3.548
1.026	3.679
1.029	4.663
1.045	4.417
1.046	4.936
1.050	6.220
1.080	5.318
1.967	6.430
1.979	5.201
1.989	8.124
1.996	5.528
1.997	5.692
1.998	6.020
2.016	6.676
2.017	6.867
2.031	6.266
2.050	7.167
2.051	7.304
2.052	7.577
2.053	7.878
3.017	7.541
3.021	8.743
3.030	6.749
3.032	7.404
3.034	7.978
3.048	7.240
3.066	7.704
3.068	8.196
3.080	7.049
3.085	8.442
4.012	7.040
4.028	6.821
4.033	8.515
4.046	7.450
4.080	7.750
4.100	8.952
5.061	7.823];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'}; 
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ThilMcIl2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females by';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: Ww in g = 0.00490*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; depth range 2 - 30 m, usually 2 - 30 m.   Tropical; 24 C - 28 C';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '78DLN'; % Cat of Life
metaData.links.id_ITIS = '645979'; % ITIS
metaData.links.id_EoL = '46580289'; % Ency of Life
metaData.links.id_Wiki = 'Pseudochromis_fuscus'; % Wikipedia
metaData.links.id_ADW = 'Pseudochromis_fuscus'; % ADW
metaData.links.id_Taxo = '105962'; % Taxonomicon
metaData.links.id_WoRMS = '278179'; % WoRMS
metaData.links.id_fishbase = 'Pseudochromis-fuscus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pseudochromis_fuscus}}';
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
bibkey = 'ThilMcIl2016'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00338-015-1367-y}, ' ...
'author = {Thillainath, E.C. and J.L. McIlwain and S.K. Wilson and M. Depczynski}, ' ... 
'year = {2016}, ' ...
'title = {Estimating the role of three mesopredatory fishes in coral reef food webs at {N}ingaloo {R}eef, {W}estern {A}ustralia}, ' ...
'journal = {Coral Reefs}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.se/summary/Pseudochromis-fuscus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
