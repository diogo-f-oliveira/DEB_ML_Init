function [data, auxData, metaData, txtData, weights] = mydata_Hyporhamphus_intermedius

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Hemiramphidae';
metaData.species    = 'Hyporhamphus_intermedius'; 
metaData.species_en = 'Eastern river Asian pencil halfbeak'; 

metaData.ecoCode.climate = {'Cfa', 'MB'};
metaData.ecoCode.ecozone = {'THp', 'MPNW'};
metaData.ecoCode.habitat = {'0jFr', '0iMm'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biPz', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 16];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 16];

%% set data
% zero-variate data

data.am = 9*365;     units.am = 'd';    label.am = 'life span';             bibkey.am = 'StewHugh2007';   
  temp.am = C2K(20.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 10;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 20.3;   units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 4.2e-3;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 1.7;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00186*Lp^2.96, see F1';
data.Wwi = 13.8;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00186*Li^2.96, see F1';

data.Ri = 150/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
temp.Ri = C2K(20.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.95, reflecting reported low fecundity';
 
% uni-variate data
% time-length
data.tL = [... % time since birth (d), fork length (cm)
533.754	11.906
365+206.396	12.139
365+235.156	13.028
365+265.608	13.235
365+300.290	14.019
365+366.269	14.171
365+473.696	14.792
730+301.981	16.114
730+333.279	16.060
730+366.269	16.581];
data.tL(:,1) = data.tL(:,1) + 90; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(20.7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'YeMore2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'wet weight (g) = 0.00186*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3NYF4'; % Cat of Life
metaData.links.id_ITIS = '165489'; % ITIS
metaData.links.id_EoL = '46567030'; % Ency of Life
metaData.links.id_Wiki = 'Hyporhamphus_regularis'; % Wikipedia
metaData.links.id_ADW = 'Hyporhamphus_regularis'; % ADW
metaData.links.id_Taxo = '192875'; % Taxonomicon
metaData.links.id_WoRMS = '293615'; % WoRMS
metaData.links.id_fishbase = 'Hyporhamphus-regularis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyporhamphus}}'];
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
bibkey = 'YeMore2014'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jai.12405}, ' ...
'author = {S. Ye and J. Moreau and W. Zeng and T. Zhang and J. Liu and Z. Li}, ' ... 
'year = {2014}, ' ...
'title = {Growth and mortality of two small ﬁshes, \emph{Toxabramis swinhonis} {G}unther, 1873 and \emph{Hyporhamphus intermedius} ({C}antor, 1842), in a {Y}angtze shallow lake ({C}hina) assessed by length frequency analysis}, ' ...
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = {30}, ' ...
'pages = {479–484}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.fishbase.org/summary/Hyporhamphus-australis.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

