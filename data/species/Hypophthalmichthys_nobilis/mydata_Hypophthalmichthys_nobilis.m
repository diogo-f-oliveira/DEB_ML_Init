  function [data, auxData, metaData, txtData, weights] = mydata_Hypophthalmichthys_nobilis
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Hypophthalmichthys_nobilis'; 
metaData.species_en = 'Bighead carp'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFr', 'jpFc'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 09 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 16]; 

%% set data
% zero-variate data
data.am = 20*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 65;     units.Lp = 'cm';   label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 170;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  comment.Li = 'based on SL 146 cm and F2';

data.Wwb = 1.2e-3;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'SchrGuy2002';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.13^3';
data.Wwp = 4e3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01288*Lp^3.06, see F1';
data.Wwi = 73.8e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01288*Li^3.03, see F1';

data.Ri  = 1938333/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
data.tL_f = [ ... % time since hatch (d), total length (cm)
1	18.827    
2	35.519
3	54.218
4	66.435
5	74.948
6	85.931
7	69.290];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1));
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
  temp.tL_f = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature'; 
bibkey.tL_f = {'SchrGuy2002'};
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since hatch (d), total length (cm)
1	18.210
2	34.284
3	52.675
4	65.046
5	72.788
6	70.190];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1));
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
  temp.tL_m = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature'; 
bibkey.tL_m = {'SchrGuy2002'};
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 5;
weights.tL_m = weights.tL_m * 5;
weights.Li = weights.Li * 3;
weights.Wwi = weights.Wwi * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';
weights.psd.v = weights.psd.v * 2;
weights.psd.p_M = weights.psd.p_M * 2;

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
D1 = 'males are assumed not to to differ from females';
D2 = 'mean temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01288*(TL in cm)^3.06'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.86*TL';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6N2TM'; % Cat of Life
metaData.links.id_ITIS = '163692'; % ITIS
metaData.links.id_EoL = '204760'; % Ency of Life
metaData.links.id_Wiki = 'Hypophthalmichthys_nobilis'; % Wikipedia
metaData.links.id_ADW = 'Hypophthalmichthys_nobilis'; % ADW
metaData.links.id_Taxo = '89958'; % Taxonomicon
metaData.links.id_WoRMS = '154600'; % WoRMS
metaData.links.id_fishbase = 'Hypophthalmichthys-nobilis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Hypophthalmichthys_nobilis}}';  
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hypophthalmichthys-nobilis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SchrGuy2002'; type = 'article'; bib = [ ... 
'author = {Sally J. Schranka and Christopher S. Guy}, ' ... 
'year = {2002}, ' ...
'title = {Age, growth, and gonadal characteristics of adult bighead carp, \emph{Hypophthalmichthys nobilis}, in the lower {M}issouri {R}iver}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {64}, ' ...
'pages = {443-450}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

