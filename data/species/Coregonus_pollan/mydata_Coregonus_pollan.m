  function [data, auxData, metaData, txtData, weights] = mydata_Coregonus_pollan
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Coregonus_pollan'; 
metaData.species_en = 'Irish pollan'; 

metaData.ecoCode.climate = {'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg', 'Fs'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 02 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 13];

%% set data
% zero-variate data
data.am = 10*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(10.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 27;    units.Lp = 'cm'; label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase'; 
  comment.Lp = 'from tL data at tp';
data.Li = 35;    units.Li = 'cm'; label.Li = 'ultimate total length';      bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 218;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based in 0.00537*Li^3.22, see F1';
data.Wwi = 503;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based in 0.00537*Li^3.22, see F1; max. published weight: 450.00 g ';
    
data.Ri = 2e3/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';      bibkey.Ri = 'guess';
  temp.Ri = C2K(10.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Coregonus_chadary: 12100*503/2988';
  
% univariate data

% time-length
data.tL_fm = [ ... % time since birth (yr), total length (cm)
1 15.7 16.0
2 21.4 21.7
3 24.7 24.7
4 26.9 26.7
5 28.7 28.3];
data.tL_fm(:,1) = 365 * (0.5 + data.tL_fm(:,1));
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(10.5);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'WilsPitc1984'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 15 * weights.tL_fm;

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
D1 = 'Males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight relationship: Ww in  g = 0.00537*(TL in cm)^3.22';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'YDB9'; % Cat of Life
metaData.links.id_ITIS = '623426'; % ITIS
metaData.links.id_EoL = '207503'; % Ency of Life
metaData.links.id_Wiki = 'Coregonus_pollan'; % Wikipedia
metaData.links.id_ADW = 'Coregonus_pollan'; % ADW
metaData.links.id_Taxo = '171731'; % Taxonomicon
metaData.links.id_WoRMS = '1022580'; % WoRMS
metaData.links.id_fishbase = 'Coregonus-pollan'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coregonus_pollan}}';  
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
bibkey = 'WilsPitc1984'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1095-8649.1984.tb04786.x}, ' ...
'author = {Wilson, J. P. F. and Pitcher, T. J.}, ' ...
'year = {1984}, ' ...
'title = {Age determination and growth of the pollan, \emph{Coregonus autumnalis pollan} {T}hompson, of {L}ough {N}eagh, {N}orthern {I}reland}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'pages = {151–163}, ' ...
'volume = {24(2)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Coregonus_pollan}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
