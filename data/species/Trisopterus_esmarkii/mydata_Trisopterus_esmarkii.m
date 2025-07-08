function [data, auxData, metaData, txtData, weights] = mydata_Trisopterus_minutus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Gadidae';
metaData.species    = 'Trisopterus_esmarkii'; 
metaData.species_en = 'Norway pout'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.8); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2022 06 19]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 19]; 

%% set data
% zero-variate data
data.am = 5*365;     units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';  
  temp.am = C2K(7.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 14;   units.Lp = 'cm';   label.Lp = 'total length at puberty';      bibkey.Lp = 'fishbase';
data.Li = 35;   units.Li = 'cm';   label.Li = 'ultimate total length';        bibkey.Li = 'fishbase';

data.Wwb = 8.82e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'MunkNiel2005';
  comment.Wwb = 'based on egg diameter of 1.19  mm: pi/6*0.119^3';
data.Wwp = 19.4;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';  
  comment.Wwp = 'based on 0.00589*Lp^3.07, see F2';
data.Wwi = 324; units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight';  bibkey.Wwi = 'fishbase';     
  comment.Wwi = 'based on 0.00589*Li^3.07, see F2';

data.Ri = 384190/365; units.Ri = '#/d';  label.Ri = 'reprod rate at 26.5 cm'; bibkey.Ri = 'fishbase';
  temp.Ri = C2K(7.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length data
data.tL_Nf = [ ... % age (years) ~ Length (cm) 
0.981	11.384
1.259	13.094
1.489	15.201
1.757	15.812
1.987	16.117
2.256	15.805
2.495	17.340
2.994	18.476
3.243	16.494
3.482	19.260
3.760	19.519
4.010	21.054
4.268	19.951];
data.tL_Nf(:,1) = 365 * data.tL_Nf(:,1); % convert yr to d
units.tL_Nf = {'d', 'cm'}; label.tL_Nf = {'time since birth', 'total length', 'females'};  
bibkey.tL_Nf = 'LambNiel2009';
comment.tL_Nf = 'Data for females from North Sea';
%
data.tL_Nm = [ ... % age (years) ~ Length (cm) 
1.000	10.923
1.288	12.725
1.508	14.484
1.728	14.967
1.939	15.187
2.236	15.407
2.495	16.901
2.725	17.077
2.984	17.077
3.243	17.429
3.511	18.044
3.971	18.484
4.259	18.396];
data.tL_Nm(:,1) = 365 * data.tL_Nm(:,1); % convert yr to d
units.tL_Nm = {'d', 'cm'}; label.tL_Nm = {'time since birth', 'total length', 'males'};  
bibkey.tL_Nm = 'LambNiel2009';
comment.tL_Nm = 'Data for males from North Sea';
%
data.tL_Sf = [ ... % age (years) ~ Length (cm) 
0.990	10.813
1.220	13.051
1.489	13.355
1.719	14.450
1.987	11.765
2.227	11.498
2.466	15.362
2.754	16.633
3.252	13.417
3.502	16.974
4.010	18.021
4.240	16.303];
data.tL_Sf(:,1) = 365 * data.tL_Sf(:,1); % convert yr to d
units.tL_Sf = {'d', 'cm'}; label.tL_Sf = {'time since birth', 'total length', 'females'};  
bibkey.tL_Sf = 'LambNiel2009';
comment.tL_Sf = 'Data for females from Skagerrak and Kattegat';
%
data.tL_Sm = [ ... % age (years) ~ Length (cm) 
1.000	10.615
1.268	12.066
1.498	12.593
1.738	14.615
2.026	13.736
2.256	11.275
2.390	13.209
2.514	14.923
2.754	15.670
3.003	15.670
3.137	14.615
3.281	13.560
3.521	16.330
3.770	13.209];
data.tL_Sm(:,1) = 365 * data.tL_Sm(:,1); % convert yr to d
units.tL_Sm = {'d', 'cm'}; label.tL_Sm = {'time since birth', 'total length', 'males'};  
bibkey.tL_Sm = 'LambNiel2009';
comment.tL_Sm = 'Data for males from Skagerrak and Kattegat';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Nf = 2 * weights.tL_Nf;
weights.tL_Nm = 2 * weights.tL_Nm;
weights.tL_Sf = 2 * weights.tL_Sf;
weights.tL_Sm = 2 * weights.tL_Sm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Nf','tL_Nm'}; subtitle1 = {'Data for females, males in North Sea'};
set2 = {'tL_Sf','tL_Sm'}; subtitle2 = {'Data for females, males in Skagerak/Kattegat'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Temperature (in C) for tL_N data is assumed to vary as T(t)=T_N+5*sin(2*pi*(t+t_T0)/365); func resp as f(t) = min(1,f_N+s_N*T(t)/T_N)';
D2 = 'Temperature (in C) for tL_S data is assumed to vary as T(t)=T_S+7*sin(2*pi*(t+t_T0)/365); func resp as f(t) = min(1,f_S+s_S*T(t)/T_S)';
D3 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Preferred temperature 16 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight Ww in g = 0.00589*(TL in cm)^3.07 ';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'benthopelagic';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '592TH'; % Cat of Life
metaData.links.id_ITIS = '164756'; % ITIS
metaData.links.id_EoL = '46564435'; % Ency of Life
metaData.links.id_Wiki = 'Trisopterus_esmarkii'; % Wikipedia
metaData.links.id_ADW = 'Trisopterus_esmarkii'; % ADW
metaData.links.id_Taxo = '44357'; % Taxonomicon
metaData.links.id_WoRMS = '126444'; % WoRMS
metaData.links.id_fishbase = 'Trisopterus-esmarkii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trisopterus_esmarkii}}';
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
bibkey = 'LambNiel2009'; type = 'article'; bib = [ ...
'author = {Lambert, G. and Nielsen, J. R. and Larsen, L. I. and Sparholt, H.}, ' ... 
'year   = {2009}, ' ...
'title  = {Maturity and growth population dynamics of {N}orway pout (\emph{Trisopterus esmarkii}) in the {N}orth {S}ea, {S}kagerrak, and {K}attegat}, ' ...
'journal = {ICES Journal of Marine Science}, ' ...
'page = {1899 –1914}, ' ...
'volume = {66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MunkNiel2005'; type = 'Book'; bib = [ ...  
'author = {Munk, P. and Nielsen, J. G.}, ' ...
'year = {2005}, ' ...
'title  = {Eggs and larvae of {N}orth {S}ea fishes}, ' ...
'publisher = {biofolia}, ' ...
'address = {Frederiksberg, DK}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Trisopterus-esmarkii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
