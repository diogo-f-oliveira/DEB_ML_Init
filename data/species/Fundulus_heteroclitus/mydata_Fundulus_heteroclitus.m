  function [data, auxData, metaData, txtData, weights] = mydata_Fundulus_heteroclitus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Fundulidae';
metaData.species    = 'Fundulus_heteroclitus'; 
metaData.species_en = 'Mummichog'; 
metaData.ecoCode.climate = {'MB','Dfb'};
metaData.ecoCode.ecozone = {'MAW','THn'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Mc','Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','piHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(22.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 06 29];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 06 29]; 

%% set data
% zero-variate data
data.ab = 30;        units.ab = 'd';  label.ab = 'age at birth';     bibkey.ab = 'KneiStiv1978';
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 5*365;        units.am = 'd';  label.am = 'time since birth at death';     bibkey.am = 'KneiStiv1978';
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 4;     units.Lp = 'cm';     label.Lp = 'standard length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 15;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 9.2e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'fishbase';   
  comment.Wwb = 'based on egg diameter of 2.6 mm for Fundulus parvipinnis: pi/6*0.26^3';
data.Wwi = 59;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';   
  comment.Wwi = 'based on 0.00700*Li^3.340, see F1';

data.Ri = 512/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'KneiStiv1978';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data

data.tL = [ ... % seasons (#), total length (cm)
0.014	0.655
0.995	3.210
1.981	4.679
2.983	6.196
3.987	7.170];
data.tL(:,1) = 365 * (0.4 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KneiStiv1978';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% Facts
F1 = 'length-weight: Ww in g = 0.00700*(TL in cm)^3.340'; 	
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6K3GC'; % Cat of Life
metaData.links.id_ITIS = '165647'; % ITIS
metaData.links.id_EoL = '1157172'; % Ency of Life
metaData.links.id_Wiki = 'Fundulus_heteroclitus'; % Wikipedia
metaData.links.id_ADW = 'Fundulus_heteroclitus'; % ADW
metaData.links.id_Taxo = '44518'; % Taxonomicon
metaData.links.id_WoRMS = '159306'; % WoRMS
metaData.links.id_fishbase = 'Fundulus-heteroclitus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fundulus_heteroclitus}}';
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
bibkey = 'KneiStiv1978'; type = 'Article'; bib = [ ...  
'author = {R. T. Kneib and A. E. Stiven}, ' ...
'year = {1978}, ' ...
'title = {GROWTH, REPRODUCTION, AND FEEDISG OF \emph{Fundulus heteroclitus} ({L}.) ON A {N}ORTH {C}AROLINA SALT MARSH}, ' ... 
'journal = {J. exp mar. Biol. Ecol}, ' ...
'volume = {52}, '...
'pages = {121-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Fundulus-heteroclitus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

