  function [data, auxData, metaData, txtData, weights] = mydata_Lepomis_symmetricus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Centrarchidae';
metaData.species    = 'Lepomis_symmetricus'; 
metaData.species_en = 'Bantam sunfish'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFr'};
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
data.am = 3.5*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'fishesoftexas';
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 4;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'fishesoftexas'; 
   comment.Lp = 'based on SL 3.4 cm and F2';
data.Li = 7.55;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishesoftexas';

data.Wwb = 2.68e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'fishesoftexas';   
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 0.86;  units.Wwp = 'g'; label.Wwp = 'wet weight at piberty'; bibkey.Wwp = {'fishbase','fishesoftexas'}; 
  comment.Wwp = 'based on 0.01230*Lp^3.06, see F1';
data.Wwi = 6;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = {'fishbase','fishesoftexas'}; 
  comment.Wwi = 'based on 0.01230*Li^3.06, see F1';

data.Ri = 1600/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'fishesoftexas';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL = [ ... % time (yr), total length (cm)
    1  4.5
    2  5.5
    3  6.0];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert nmth to yr
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fishesoftexas';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

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
F1 = 'length-weight: Ww in g = 0.01230*(TL in cm)^3.06'; 
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.84*TL'; 
metaData.bibkey.F2 = 'fishesoftexas'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6PCSN'; % Cat of Life
metaData.links.id_ITIS = '168156'; % ITIS
metaData.links.id_EoL = '207667'; % Ency of Life
metaData.links.id_Wiki = 'Lepomis_symmetricus'; % Wikipedia
metaData.links.id_ADW = 'Lepomis_symmetricus'; % ADW
metaData.links.id_Taxo = '178463'; % Taxonomicon
metaData.links.id_WoRMS = '1019890'; % WoRMS
metaData.links.id_fishbase = 'Lepomis-symmetricus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lepomis_symmetricus}}';
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
'howpublished = {\url{http://txstate.fishesoftexas.org/lepomis symmetricus.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Lepomis-symmetricus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
