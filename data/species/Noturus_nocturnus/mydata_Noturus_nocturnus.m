function [data, auxData, metaData, txtData, weights] = mydata_Noturus_nocturnus

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Noturus_nocturnus'; 
metaData.species_en = 'Freckled madtom'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 08 14]; 

%% set data
% zero-variate data;

data.am = 4*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'fishesoftexas';
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9.2;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishesoftexas';
  comment.Lp = 'Based on SL 7.8 cm, see F2';
data.Li  = 16.2;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishesoftexas'; 
  comment.Lp = 'Based on SL 13.8 cm, see F2';
  
data.Wwb = 6.4e-3; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishesoftexas'; 
  comment.Wwb = 'based on egg diameter of 2.3 mm: pi/6*0.23^3';
data.Wwp = 5.6; units.Wwp = 'g';	label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishesoftexas','fishbase'};
  comment.Wwp = 'based on 0.00575*Lp^3.10, see F1';
data.Wwi = 32.3; units.Wwi = 'g';	label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'fishesoftexas','fishbase'};
  comment.Wwi = 'based on 0.00575*Li^3.10, see F1';
  
data.Ri  = 116/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate at SL 7.5 cm, TL 8.8 cm';  bibkey.Ri  = 'fishesoftexas';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % year class (yr), standard length (cm)
    1 6.5
    2 7.8
    3 8.5];
data.tL(:,1) = (1 + data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)/ 0.85; % convert SL to TL
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fishesoftexas';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Mean temperature is guessed';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.85*TL';
metaData.bibkey.F2 = 'fishesoftexas'; 
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZN5'; % Cat of Life
metaData.links.id_ITIS = '164005'; % ITIS
metaData.links.id_EoL = '208076'; % Ency of Life
metaData.links.id_Wiki = 'Noturus_nocturnus'; % Wikipedia
metaData.links.id_ADW = 'Noturus_nocturnus'; % ADW
metaData.links.id_Taxo = '181580'; % Taxonomicon
metaData.links.id_WoRMS = '1019808'; % WoRMS
metaData.links.id_fishbase = 'Noturus-nocturnus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Noturus_nocturnus}}';
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
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/noturus nocturnus.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Noturus-nocturnus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

