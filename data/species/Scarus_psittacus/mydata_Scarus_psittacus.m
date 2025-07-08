function [data, auxData, metaData, txtData, weights] = mydata_Scarus_psittacus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Scaridae';
metaData.species    = 'Scarus_psittacus'; 
metaData.species_en = 'Common parrotfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW','MI'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.1); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 27];

%% set data
% zero-variate data

data.am = 5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(28.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 12.6; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Lim  = 43;  units.Lim  = 'cm';  label.Lim  = 'ultimate total length'; bibkey.Lim  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.75 mm of Chaetodon: 4/3*pi*0.038^3'; 
data.Wwp = 34.3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01549*Lp^3.04, see F1';
data.Wwi = 1.4e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01549*Li^3.04, see F1; max published weight 1.8 kg';

data.GSI = 3*0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(28.1); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Hipposcarus_longiceps, assumed: 3 spawnings per year';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.735	9.510
0.963	14.797
1.012	11.621
1.014	10.298
1.940	14.514
1.988	12.661
1.990	10.809
2.963	15.288
3.006	18.726
4.909	22.923
4.914	17.897
5.936	18.935];
data.tL_f(:,1) = 365*(0+data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(28.1);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TaylChoat2014'; 
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
1.933	22.450
1.936	18.746
1.937	17.424
1.939	15.836
1.981	20.862
1.986	14.777
2.024	24.300
2.862	22.962
2.911	20.844
2.913	18.993
2.953	25.341
2.960	18.198
2.961	16.875
3.939	16.063
3.983	18.179
3.984	17.120
4.024	23.998
4.027	21.088
5.004	20.540];
data.tL_m(:,1) = 365*(0+data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(28.1);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TaylChoat2014'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01549*(TL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XW9Z'; % Cat of Life
metaData.links.id_ITIS = '170855'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Scarus_psittacus'; % Wikipedia
metaData.links.id_ADW = 'Scarus_psittacus'; % ADW
metaData.links.id_Taxo = '186705'; % Taxonomicon
metaData.links.id_WoRMS = '219125'; % WoRMS
metaData.links.id_fishbase = 'Scarus-psittacus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scarus_psittacus}}';
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
bibkey = 'TaylChoat2014'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.12294}, ' ...
'author = {B. M. Taylor and J. H. Choat}, ' ... 
'year = {2014}, ' ...
'title = {Comparative demography of commercially important parrotfish species from {M}icronesia}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {84}, ' ...
'pages = {283-546}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Scarus-psittacus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

