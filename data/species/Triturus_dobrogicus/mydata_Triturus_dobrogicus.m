function [data, auxData, metaData, txtData, weights] = mydata_Triturus_dobrogicus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Triturus_dobrogicus'; 
metaData.species_en = 'Danube crested newt'; 

metaData.ecoCode.climate = {'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', 'jiFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am';  'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 30];

%% set data
% zero-variate data;
data.ab = 25;      units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';    
  temp.ab = C2K(13); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '12 to 20 d';
data.tj = 90;     units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'Wiki';
  temp.tj = C2K(13);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '2-4 mnth';
data.tp = 2.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(13);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(13);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 5.4;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';    bibkey.Lp  = 'guess';
  comment.Lp = 'based on Triturus_karelinii';
data.Li  = 9.9;   units.Li  = 'cm';  label.Li  = 'ultimate SVL';      bibkey.Li  = 'Wiki';
  comment.Li = 'TL 18 cm, converted to SVL using F1';
data.Lim  = 9.2;   units.Lim  = 'cm';  label.Lim  = 'ultimate SVL';      bibkey.Lim  = 'guess';
  comment.Lim = 'based on tL data and Li';

data.Wwb = 3.5e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Triturus cristatus'; 
data.Wwi = 10.6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Triturus cristatus';
data.Wwim = 8.5;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';        bibkey.Wwim = 'guess';
  comment.Wwim = 'based on (Lim/Li)^3*Wwi';

data.Ri  = 200/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '200 egg per clutch, 1 clutch per yr';

% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), SVL  (cm)
1	4.570 NaN
1	4.165 NaN
1	4.291 NaN
1	4.443 NaN
2	5.203 4.139
2	4.747 5.051
2   NaN   5.962
3	7.278 6.443
3	6.544 6.620
3	7.658 6.747
3	8.468 6.873
3	5.127 7.076
4	6.443 6.646
4	7.987 6.873
4	6.772 7.861
4   NaN   7.076
4   NaN   7.228
5	7.177 NaN
5	8.013 NaN];
data.tL_fm(:,1) = 365 * (data.tL_fm(:,1)+0.7);
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'SVL', 'female'};  
temp.tL_fm   = C2K(13);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'CogaMiau2003'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'Data for females';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'From photo: SVL = TL * 0.55';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '595F5'; % Cat of Life
metaData.links.id_ITIS = '1106477'; % ITIS
metaData.links.id_EoL = '332577'; % Ency of Life
metaData.links.id_Wiki = 'Triturus_dobrogicus'; % Wikipedia
metaData.links.id_ADW = 'Triturus_dobrogicus'; % ADW
metaData.links.id_Taxo = '151424'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Triturus+dobrogicus'; % AmphibiaWeb

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Triturus_dobrogicus}}';   
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
bibkey = 'CogaMiau2003'; type = 'Article'; bib = [ ...  
'author = {Dan Cog\v{a}lniceanu and Claude Miaud}, ' ...
'title = {Population age structure and growth in four syntopic amphibian species inhabiting a large river floodplain}, ' ...
'journal = {Can. J. Zool.}, ' ...
'volume = {81}, ' ...
'pages = {1096–1106}, ' ...
'year = {2003}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/332577/articles}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Triturus+dobrogicus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

