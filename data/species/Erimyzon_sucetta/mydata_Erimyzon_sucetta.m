  function [data, auxData, metaData, txtData, weights] = mydata_Erimyzon_sucetta

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Erimyzon_sucetta'; 
metaData.species_en = 'Lake chubsucker'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp','0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 013];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 13]; 

%% set data
% zero-variate data
data.am = 7*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishesoftexas';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 15;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'fishesoftexas'; 
  comment.Lp = 'based on tp 3 yr, and tL data';
data.Li = 39.4;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishesoftexas';

data.Wwb = 4.2e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'fishesoftexas';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 39.5; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';          bibkey.Wwp = {'fishbase','fishesoftexas'};
  comment.Wwp = 'based on 0.01202*Lp^2.99, see F1';
data.Wwi = 708.7; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';            bibkey.Wwi = {'fishbase','fishesoftexas'};
  comment.Wwi = 'based on 0.01202*Li^2.99, see F1';

data.Ri  = 18478/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate at TL 34.7 cm';    bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % year class (yr), total length (cm)
    1  6.1
    2 14.5
    3 19.8
    4 24.0
    5 26.1
    6 27.8];
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
F1 = 'length-weight: Ww in g = 0.01202 * (TL in cm)^2.99'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6GPKK'; % Cat of Life
metaData.links.id_ITIS = '163922'; % ITIS
metaData.links.id_EoL = '994794'; % Ency of Life
metaData.links.id_Wiki = 'Erimyzon_sucetta'; % Wikipedia
metaData.links.id_ADW = 'Erimyzon_sucetta'; % ADW
metaData.links.id_Taxo = '41678'; % Taxonomicon
metaData.links.id_WoRMS = '159991'; % WoRMS
metaData.links.id_fishbase = 'Erimyzon-sucetta'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Erimyzon_sucetta}}';  
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
'howpublished = {\url{https://www.fishbase.se/summary/Erimyzon-sucetta.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/erimyzon sucetta.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

