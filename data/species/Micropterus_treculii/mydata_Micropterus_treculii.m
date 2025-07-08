  function [data, auxData, metaData, txtData, weights] = mydata_Micropterus_treculii
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Centrarchidae';
metaData.species    = 'Micropterus_treculii'; 
metaData.species_en = 'Guadalupe bass'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 17]; 

%% set data
% zero-variate data
data.am = 6*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'fishesoftexas';
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 8.3;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'fishesoftexas'; 
   comment.Lp = 'based on SL 7 cm and F2';
data.Li = 45.2;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishesoftexas';
   comment.Li = 'based on SL 38 cm and F2';

data.Wwb = 5.4e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'fishesoftexas';   
  comment.Wwb = 'based on egg diameter of 2.17 mm: pi/6*0.217^3';
data.Wwp = 9.8;  units.Wwp = 'g'; label.Wwp = 'wet weight at piberty'; bibkey.Wwp = {'fishbase','fishesoftexas'}; 
  comment.Wwp = 'based on 0.01716*Lp^3.00, see F1';
data.Wwi = 1.58e3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = {'fishbase','fishesoftexas'}; 
  comment.Wwi = 'based on 0.01716*Li^3.00, see F1';

data.Ri = 9286/365;  units.Ri = '#/d';  label.Ri = 'reprod rate at SL 24.2 cm, TL 28.8';  bibkey.Ri = 'fishesoftexas';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL = [ ... % time (yr), total length (cm)
    0  7
    1  15
    2  17.5];
data.tL(:,1) = 365 * (0.4 + data.tL(:,1)); % convert nmth to yr
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fishesoftexas';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 10 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
               
%% Discussion
D1 = 'mean temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01716*(TL in cm)^3'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.84*TL'; 
metaData.bibkey.F2 = 'fishesoftexas'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4353K'; % Cat of Life
metaData.links.id_ITIS = '168162'; % ITIS
metaData.links.id_EoL = '223476'; % Ency of Life
metaData.links.id_Wiki = 'Micropterus_treculii'; % Wikipedia
metaData.links.id_ADW = 'Micropterus_treculii'; % ADW
metaData.links.id_Taxo = '180100'; % Taxonomicon
metaData.links.id_WoRMS = '1463308'; % WoRMS
metaData.links.id_fishbase = 'Micropterus-treculii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Micropterus_treculii}}';
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
'howpublished = {\url{http://txstate.fishesoftexas.org/micropterus treculii.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Micropterus-treculii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
