function [data, auxData, metaData, txtData, weights] = mydata_Monochirus_hispidus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Pleuronectiformes'; 
metaData.family     = 'Soleidae';
metaData.species    = 'Monochirus_hispidus'; 
metaData.species_en = 'Whiskered sole'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.1); % in K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 05 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 13];

%% set data
% zero-variate data;

data.ab = 15.5;      units.ab = 'd';      label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(18.1);  units.temp.ab = 'K'; label.temp.ab = 'temperature';       
data.am = 7*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AmarCabr2004';  
  temp.am = C2K(18.1); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'fishbase gives 15 yr';
  
data.Lp  = 8.5;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase';
data.Li = 22;    units.Li = 'cm';   label.Li = 'ultimate total length for females';    bibkey.Li = 'fishbase';

data.Wwb = 1.4e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.38  mm of Pegusa lascaris: pi/6*0.138^3';
data.Wwp = 7.0;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00977*Lp^3.07, see F1';
data.Wwi = 129.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00977*Li^3.07, see F1';

data.Ri = 75; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(18.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL_f = [ ... % age (years), total length (cm)
0.991	6.658
1.002	7.457
1.002	7.609
1.012	5.630
1.012	6.049
1.012	6.391
1.013	6.886
1.014	8.370
1.023	5.212
1.023	6.201
1.035	7.076
1.047	8.141
1.999	8.674
2.000	8.826
2.000	9.435
2.000	9.587
2.001	10.082
2.021	7.799
2.021	8.103
2.022	9.777
2.023	10.272
2.023	10.766
2.032	7.609
2.986	10.690
2.987	11.337
2.987	11.413
2.987	12.022
2.997	9.625
2.997	10.196
2.997	10.348
2.998	10.957
2.998	11.185
2.999	12.136
3.008	9.891
3.008	10.462
3.010	12.783
3.019	9.511
3.031	11.717
4.028	12.478
4.029	12.821];
data.tL_f(:,1) = (.75 + data.tL_f(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_f,1); if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3;end;end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(18.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'AmarCabr2004';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % age (years), total length (cm)
0.967	8.093
0.978	8.285
0.980	6.482
0.981	6.175
0.982	5.216
0.991	7.019
0.992	5.984
0.993	5.830
0.993	5.447
1.001	7.825
1.002	6.712
1.003	6.597
1.004	5.907
1.955	9.512
1.956	9.052
1.957	8.170
1.958	8.016
1.968	8.745
1.968	8.515
1.968	8.323
1.977	9.704
1.978	8.899
1.987	10.241
1.988	9.819
2.000	9.282
2.002	7.901
2.957	9.858
2.957	9.819
2.958	9.167
2.968	9.359
2.977	10.740
2.978	10.548
2.978	10.433
2.979	9.551
2.980	8.822
2.989	10.279
2.990	10.126
3.990	11.162];
data.tL_m(:,1) = (.75 + data.tL_m(:,1)) * 365; % convert yr to d
for i=2:size(data.tL_m,1); if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3;end;end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(18.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'AmarCabr2004';
comment.tL_m = 'Data for males';

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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00977*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4467H'; % Cat of Life
metaData.links.id_ITIS = '616402'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Monochirus_hispidus'; % Wikipedia
metaData.links.id_ADW = 'Monochirus_hispidus'; % ADW
metaData.links.id_Taxo = '180283'; % Taxonomicon
metaData.links.id_WoRMS = '127155'; % WoRMS
metaData.links.id_fishbase = 'Monochirus-hispidus'; % fishbase

%% References 
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Monochirus_hispidus}}';
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
bibkey = 'AmarCabr2004'; type = 'article'; bib = [ ...
'author = {V. Amaral and H. N. Cabral}, ' ... 
'year   = {2004}, ' ...
'title  = {Ecology of the whiskered sole in the {S}ado {E}stuary, {P}ortugal}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'page = {460–474}, ' ...
'volume = {64}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Monochirus-hispidus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

