  function [data, auxData, metaData, txtData, weights] = mydata_Cycleptus_elongatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Cycleptus_elongatus'; 
metaData.species_en = 'Blue sucker'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 012];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 12]; 

%% set data
% zero-variate data
data.am = 13*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 56.8;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'fishesoftexas'; 
  comment.Lp = 'based on tp 5 yr, and tL data';
data.Li = 82.5;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishesoftexas';

data.Wwb = 5.2e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'fishesoftexas';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 1.31e3; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';          bibkey.Wwp = {'fishbase','fishesoftexas'};
  comment.Wwp = 'based on 0.00407*Lp^3.14, see F1';
data.Wwi = 4.24e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';            bibkey.Wwi = {'fishbase','fishesoftexas'};
  comment.Wwi = 'based on 0.00407*Li^3.14, see F1';

data.Ri  = 1.18e6/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';    bibkey.Ri  = 'fishesoftexas';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecudity of 278 eggs/g: 278*Wwi/365';

% univariate data

% time-length
data.tL = [ ... % year class (yr), total length (cm)
    1 mean([18.9 20.5])
    2 mean([29.6 34.6])
    3 mean([39.7 46.1])
    4 mean([47.1 51.2])
    5 mean([53.3 56.9])
    6 mean([57.8 61.1])
    7 mean([58.9 64.1])
    8 mean([64.3 68.0])
    9 mean([71.1 73.2])
   10 79.8];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fishesoftexas';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00407 * (TL in cm)^3.14'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '32T6V'; % Cat of Life
metaData.links.id_ITIS = '163953'; % ITIS
metaData.links.id_EoL = '994767'; % Ency of Life
metaData.links.id_Wiki = 'Cycleptus_elongatus'; % Wikipedia
metaData.links.id_ADW = 'Cycleptus_elongatus'; % ADW
metaData.links.id_Taxo = '172477'; % Taxonomicon
metaData.links.id_WoRMS = '1022872'; % WoRMS
metaData.links.id_fishbase = 'Cycleptus-elongatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Cycleptus_elongatus}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Cycleptus-elongatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/cycleptus elongatus.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

