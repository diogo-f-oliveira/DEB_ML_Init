function [data, auxData, metaData, txtData, weights] = mydata_Scaphiophryne_gottlebei
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Microhylidae';
metaData.species    = 'Scaphiophryne_gottlebei'; 
metaData.species_en = 'Malagasy rainbow frog'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPam'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHl', 'bjCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 05];

%% set data
% zero-variate data

data.tj = 200; units.tj = 'd';    label.tj = 'time birth at metam';        bibkey.tj = 'guess';   
  temp.tj = C2K(27);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
  comment.tj = '20 to 32 d';
data.am = 2*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'GuarTess2010';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.6;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam'; bibkey.Lj  = 'guess';
data.Lp  = 3.7;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for males'; bibkey.Lp  = 'GuarTess2010';
data.Lpm  = 2.8;  units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males'; bibkey.Lpm  = 'GuarTess2010';
data.Li  = 4;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'GuarTess2010';
data.Lim  = 3;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'GuarTess2010';

data.Wwb = 4.2e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 6.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Pelophylax_esculentus: (4/9.5)^3*87.5';
data.Wwim = 2.75;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight of males';   bibkey.Wwim = 'guess';
  comment.Wwim = 'based on length-weight of Pelophylax_esculentus: (3/9.5)^3*87.5';

data.Ri  = 500/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri  = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Pelophylax_esculentus: 4000*(4/8)^3 eggs per clutch';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since metam (d), SVL (cm)
0   NaN   2.787
0   NaN   3.134
1	3.710 2.846
1	3.278 2.576
1   NaN   3.124
1   NaN   3.186
1   NaN   2.715
1   NaN   2.792
2	3.600 3.037
2	3.808 3.145
2	4.009 3.276];
data.tL_fm(:,1) = (data.tL_fm(:,1)+0.5) * 365; % convert yrs to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm    = C2K(27);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm  = 'GuarTess2010'; treat.tL_fm = {1, {'females','males'}}; 
comment.tL_fm = 'data for females, males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '6XTHX'; % Cat of Life
metaData.links.id_ITIS = '664653'; % ITIS
metaData.links.id_EoL = '1019833'; % Ency of Life
metaData.links.id_Wiki = 'Scaphiophryne_gottlebei'; % Wikipedia
metaData.links.id_ADW = 'Scaphiophryne_gottlebei'; % ADW
metaData.links.id_Taxo = '151438'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Scaphiophryne+gottlebei'; % AmphibiaWeb
metaData.links.id_AnAge = 'Scaphiophryne_gottlebei'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scaphiophryne_gottlebei}}';
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
bibkey = 'GuarTess2010'; type = 'Article'; bib = [ ...  
'doi = {10.1016/j.zool.2010.08.003}, ' ...
'author = {Guarino, F. M. and Tessa, G. and Mercurio, V. and Andreone, F.}, ' ...
'year = {2010}, ' ...
'title  = {Rapid sexual maturity and short life span in the blue-legged frog and the rainbow frog from the arid {I}salo {M}assif, southern-central {M}adagascar}, ' ...
'journal = {Zoology}, ' ...
'volme = {113(6)}, ' ...
'pages = {378–384}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Scaphiophryne+gottlebei}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Scaphiophryne_gottlebei}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

