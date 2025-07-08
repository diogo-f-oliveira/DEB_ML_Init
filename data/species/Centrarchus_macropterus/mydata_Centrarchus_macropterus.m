  function [data, auxData, metaData, txtData, weights] = mydata_Centrarchus_macropterus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Centrarchidae';
metaData.species    = 'Centrarchus_macropterus'; 
metaData.species_en = 'Flier'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
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
data.am = 8*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'fishesoftexas';
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 7.0;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'fishesoftexas'; 
   comment.Lp = 'based on tp = 3 yr and tL data';
data.Li = 35.6;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishesoftexas';

data.Wwb = 4.5e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'fishesoftexas';   
  comment.Wwb = 'based on egg diameter of 2.05 mm of Ambloplites_rupestris: pi/6*0.205^3';
data.Wwp = 6.2;  units.Wwp = 'g'; label.Wwp = 'wet weight at piberty'; bibkey.Wwp = {'fishbase','fishesoftexas'}; 
  comment.Wwp = 'based on 0.01479*Lp^3.10, see F1';
data.Wwi = 954;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = {'fishbase','fishesoftexas'}; 
  comment.Wwi = 'based on 0.01479*Li^3.10, see F1; fishbase give 1.4 kg';

data.Ri = 37.5e3/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time - length
data.tL = [ ... % year class (yr), total length (cm)
    1  4.00
    2  7.06
    3  9.98
    4 11.18
    5 15.09
    6 16.37
    7 18.37];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'fishesoftexas';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
F1 = 'length-weight for Ambloplites rupestris: Ww in g = 0.01479*(TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'S8DW'; % Cat of Life
metaData.links.id_ITIS = '168102'; % ITIS
metaData.links.id_EoL = '203709'; % Ency of Life
metaData.links.id_Wiki = 'Centrarchus_macropterus'; % Wikipedia
metaData.links.id_ADW = 'Centrarchus_macropterus'; % ADW
metaData.links.id_Taxo = '166676'; % Taxonomicon
metaData.links.id_WoRMS = '1022967'; % WoRMS
metaData.links.id_fishbase = 'Centrarchus-macropterus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Centrarchus_macropterus}}';
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
'howpublished = {\url{http://txstate.fishesoftexas.org/centrarchus macropterus.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Centrarchus-macropterus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

