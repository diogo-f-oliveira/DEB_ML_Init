function [data, auxData, metaData, txtData, weights] = mydata_Aspidophoroides_monopterygius

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Agonidae';
metaData.species    = 'Aspidophoroides_monopterygius'; 
metaData.species_en = 'Alligatorfish'; 

metaData.ecoCode.climate = {'MC','ME'};
metaData.ecoCode.ecozone = {'MPN','MANW','MN'};
metaData.ecoCode.habitat = {'biMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 08 07];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 07];

%% set data
% zero-variate data
data.ab = 54; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(4.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'ArboAven2010';   
  temp.am = C2K(4.8);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10.4;     units.Lp = 'cm';   label.Lp = 'std length at puberty'; bibkey.Lp = 'fishbase';
data.Li = 22;  units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 2.6e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ArboAven2010';
  comment.Wwb = 'based on egg diameter of 1.7 mm: pi/6*0.17^3';
data.Wwp = 3.8;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Gall1969';
  comment.Wwp = 'based on 0.00288*Lp^3.07, see F1';
data.Wwi = 38;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00288*Li^3.07, see F1';
 
data.Ri  = 3255/365;   units.Ri  = '#/d'; label.Ri  = 'max reproduction rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(4.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL_f = [ ... % time since hatch (yr), total length (cm)
1.953	7.447
2.019	5.677
2.930	9.622
2.963	8.995
2.974	9.364
2.983	11.465
2.984	11.318
2.985	10.986
2.986	9.991
2.997	8.737
2.998	8.295
2.999	8.147
3.962	12.092
3.973	8.369
3.974	11.244
3.984	8.995
3.985	9.770
3.986	10.765
3.987	13.382
3.994	11.502
3.995	11.871
3.996	12.756
4.005	10.618
4.006	11.171
4.016	9.475
4.027	10.433
4.948	12.350
4.949	10.138
4.960	10.544
4.970	11.945
4.971	9.917
4.980	11.724
4.981	11.465
4.993	10.949
4.994	9.622
5.026	12.903
5.937	10.544
5.959	11.760
5.981	11.318
5.982	12.461
5.992	13.161
5.993	13.825
6.979	12.829
6.990	14.452
6.991	13.198
6.992	12.498];
data.tL_f(:,1) = (0 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
  temp.tL_f = C2K(4.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ArboAven2010';
%
data.tL_m = [ ... % time since hatch (yr), total length (cm)
2.019	6.525
2.930	9.364
4.005	10.433
4.993	11.023
5.970	12.055
5.992	12.313
7.001	13.677];
data.tL_m(:,1) = (0 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
  temp.tL_m = C2K(4.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ArboAven2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.ab = weights.ab * 0;
weights.Li = weights.Li * 5;
weights.Ri = weights.Ri * 5;

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
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00288*(TL in cm)^3.07'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'HHCB'; % Cat of Life
metaData.links.id_ITIS = '167439'; % ITIS
metaData.links.id_EoL = '46568874'; % Ency of Life
metaData.links.id_Wiki = 'Aspidophoroides_monopterygius'; % Wikipedia
metaData.links.id_ADW = 'Aspidophoroides_monopterygius'; % ADW
metaData.links.id_Taxo = '161943'; % Taxonomicon
metaData.links.id_WoRMS = '159459'; % WoRMS
metaData.links.id_fishbase = 'Aspidophoroides-monopterygius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Aspidophoroides_monopterygius}}';  
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
bibkey = 'ArboAven2010'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10641-010-9607-z}, ' ...
'author = {Jessica H. Arbour and Patricia Avenda\~{n}o  and Jeffrey A. Hutchings}, ' ...
'year = {2010}, ' ...
'title = {Aspects of the ecology and life history of Alligatorfish \emph{Aspidophoroides monopterygius}}, ' ... 
'journal = {Environ Biol Fish}, ' ...
'volume = {87}, '...
'pages = {353–362}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Aspidophoroides-monopterygius.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

