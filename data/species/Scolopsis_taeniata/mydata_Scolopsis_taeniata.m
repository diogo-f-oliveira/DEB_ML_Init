  function [data, auxData, metaData, txtData, weights] = mydata_Scolopsis_taeniata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Nemipteridae';
metaData.species    = 'Scolopsis_taeniata'; 
metaData.species_en = 'Black-streaked monocle bream '; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MIE'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.4); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 10 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 21];

%% set data

% zero-variate data

data.am = 10*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(26.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 18.9; units.Lp = 'cm'; label.Lp = 'std length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 38;    units.Li = 'cm'; label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of  0.8 mm: pi/6*0.08^3';
data.Wwp = 103.2;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01622*Lp^2.98, see F1';
data.Wwi = 827.6;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01622*Li^2.98, see F1';

data.GSI  = 0.07; units.GSI  = '-'; label.GSI  = 'gonadosomatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(26.4);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Scolopsis monogramma';

% univariate data

% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
0.978	16.430
0.984	18.866
0.989	22.836
0.989	22.340
0.989	21.844
0.991	15.618
0.996	21.483
0.996	17.287
0.996	17.062
0.997	15.934
0.997	15.753
1.002	21.212
1.002	20.761
1.002	20.174
1.002	18.731
1.002	18.641
1.002	18.370
1.008	19.994
1.008	19.904
1.015	19.182
1.983	23.341
1.983	22.665
1.983	22.484
1.983	21.492
1.989	23.477
1.989	22.980
1.990	19.868
1.990	19.597
1.990	19.416
1.990	18.334
1.990	18.153
1.990	17.477
1.990	16.619
1.995	21.853
1.996	20.183
1.996	19.101
1.996	18.965
1.996	17.928
2.002	22.168
2.002	21.176
2.002	20.770
2.002	20.589
2.003	16.935
2.009	18.650
2.009	16.078
2.014	24.108
2.015	15.672
2.015	15.266
2.970	22.989
2.983	23.260
2.984	19.380
2.989	23.982
2.989	23.486
2.989	21.185
2.989	20.959
2.990	19.922
2.990	18.478
2.995	24.659
2.995	24.298
2.995	23.847
2.995	22.493
2.995	22.177
2.995	21.771
2.996	21.636
2.996	20.508
2.996	19.606
2.996	18.614
2.996	18.343
2.996	17.801
3.002	18.929
3.003	16.674
3.003	14.238
3.007	25.696
3.009	17.305
3.989	22.818
3.995	24.487
3.995	21.780
3.996	20.562
4.002	22.186
4.002	21.149
4.007	24.126
4.008	23.179
4.008	22.502
4.008	21.465
4.008	20.833
4.008	20.202
4.008	19.615
4.008	18.984
4.015	19.886
5.002	21.113
5.008	22.556];
data.tL(:,1) = 365 * (0.4 + data.tL(:,1));
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-6;end;end
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(26.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GranAlAb2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 3 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% % Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01622*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XXJH'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46580997'; % Ency of Life
metaData.links.id_Wiki = 'Scolopsis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3420329'; % Taxonomicon
metaData.links.id_WoRMS = '712735'; % WoRMS
metaData.links.id_fishbase = 'Scolopsis-taeniata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Scolopsis}}';  
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
bibkey = 'GranAlAb2010'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1439-0426.2009.01380.x}, ' ...
'author = {Grandcourt, E. and Al Abdessalaam, T. Z. and Francis, F. and Al Shamsi, A.}, ' ... 
'year = {2010}, ' ...
'title = {Age-based life history parameters and status assessments of by-catch species (\emph{Lethrinus borbonicus}, \emph{Lethrinus microdon}, \emph{Pomacanthus maculosus} and \emph{Scolopsis taeniatus}) in the southern {A}rabian {G}ulf}, ' ...
'journal = {Journal of Applied Ichthyology}, ' ...
'volume = {26(3)}, ' ...
'pages = {381–389}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scolopsis-taeniata.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
