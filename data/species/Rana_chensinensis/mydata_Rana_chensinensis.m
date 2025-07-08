function [data, auxData, metaData, txtData, weights] = mydata_Rana_chensinensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Rana_chensinensis'; 
metaData.species_en = 'Asiatic grass frog '; 

metaData.ecoCode.climate = {'BWk','BSk','Dw'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 30];

%% set data
% zero-variate data

data.ab = 50;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(5);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 2*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 6*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'MaTong2009';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.4;    units.Lj  = 'cm';  label.Lj  = 'SVL at metam';   bibkey.Lj  = 'MaTong2009';
data.Lp  = 5.0;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';   bibkey.Lp  = 'guess';
  comment.Lp = 'based on tP and tL data';
data.Li  = 6.5;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'MaTong2009';
data.Lim  = 5.5;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'MaTong2009';

data.Wwb = 0.0141;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 3 mm: pi/6*0.3^3';
data.Wwi = 20.2;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on 10.9 g for SVL 5.29: (6.5/5.29)^3*10.9';

data.Ri  = 1150/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '800-1500 eggs per clutch, 1 clutch per yr';
  
% univariate data
% time-length
data.tL_Lfm = [ ... % time since birth (d), SVL (cm)
0	1.435 1.409
1	3.993 4.099
2	4.640 4.600
3	4.864 4.877
4	5.141 5.022];
data.tL_Lfm(:,1) = data.tL_Lfm(:,1)*365; % convert yr to d
units.tL_Lfm  = {'d', 'cm'};  label.tL_Lfm = {'time since metam', 'SVL'};  
temp.tL_Lfm   = C2K(12.1);  units.temp.tL_Lfm = 'K'; label.temp.tL_Lfm = 'temperature';
bibkey.tL_Lfm = 'MaTong2009'; treat.tL_Lfm = {1,'females','males'};
subtitle.tL_Lfm = 'data for 567-m alt, northern China';
comment.tL_Lfm = 'data for 567-m alt, northern China';
%
data.tL_Mfm = [ ... % time since birth (d), SVL (cm)
0	1.462 1.448
1	3.651 4.112
2	4.349 4.626
3	5.009 4.837
4	5.365 5.207
5	5.615 NaN];
data.tL_Mfm(:,1) = data.tL_Mfm(:,1)*365; % convert yr to d
units.tL_Mfm  = {'d', 'cm'};  label.tL_Mfm = {'time since metam', 'SVL'};  
temp.tL_Mfm   = C2K(5.8);  units.temp.tL_Mfm = 'K'; label.temp.tL_Mfm = 'temperature';
bibkey.tL_Mfm = 'MaTong2009'; treat.tL_Mfm = {1,'females','males'};
subtitle.tL_Mfm = 'data for 1470-m alt, northern China';
comment.tL_Mfm = 'data for 1470-m alt, northern China';
%
data.tL_Hfm = [ ... % time since birth (d), SVL (cm)
0	1.422 1.475
1	4.363 4.244
2	4.996 4.943
3	5.470 5.299
4	5.840 5.035
5	5.826 5.180
6	6.327 NaN];
data.tL_Hfm(:,1) = data.tL_Hfm(:,1)*365; % convert yr to d
units.tL_Hfm  = {'d', 'cm'};  label.tL_Hfm = {'time since metam', 'SVL'};  
temp.tL_Hfm   = C2K(3.9);  units.temp.tL_Hfm = 'K'; label.temp.tL_Hfm = 'temperature';
bibkey.tL_Hfm = 'MaTong2009'; treat.tL_Hfm = {1,'females','males'};
subtitle.tL_Hfm = 'data for 1700-m alt, northern China';
comment.tL_Hfm = 'data for 1700-m alt, northern China';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Hfm = 5 * weights.tL_Hfm;
weights.tL_Mfm = 5 * weights.tL_Mfm;
weights.tL_Lfm = 5 * weights.tL_Lfm;
weights.Lj = 3 * weights.Lj;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.subtitle = subtitle;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Tadpoles have an abdominal sucker, and adaptation to living in fast-flowing streams';
metaData.bibkey.F1 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4RDLN'; % Cat of Life
metaData.links.id_ITIS = '665284'; % ITIS
metaData.links.id_EoL = '1038136'; % Ency of Life
metaData.links.id_Wiki = 'Rana_chensinensis'; % Wikipedia
metaData.links.id_ADW = 'Rana_chensinensis'; % ADW
metaData.links.id_Taxo = '145432'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rana+chensinensis'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rana_chensinensis}}';
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
bibkey = 'MaTong2009'; type = 'Article'; bib = [ ... 
'doi = {}, ' ...
'author = {Xiaoyan Ma and Lina Tong and Xin Lu}, ' ... 
'year = {2009}, ' ...
'title = {Variation of body size, age structure and growth of a temperate frog, \emph{Rana chensinensis}, over an elevational gradient in Northern {C}hina}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {30}, ' ...
'pages = {111-117}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rana+chensinensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

