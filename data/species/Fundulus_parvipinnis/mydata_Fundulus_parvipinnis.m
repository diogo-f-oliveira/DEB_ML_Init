  function [data, auxData, metaData, txtData, weights] = mydata_Fundulus_parvipinnis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Fundulidae';
metaData.species    = 'Fundulus_parvipinnis'; 
metaData.species_en = 'California killifish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMm'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 14]; 

%% set data
% zero-variate data
data.am = 3*365;        units.am = 'd';  label.am = 'time since birth at death';     bibkey.am = 'fishbase';
  temp.am = C2K(22.5); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 5;     units.Lp = 'cm';     label.Lp = 'standard length at puberty'; bibkey.Lp = 'guess'; 
data.Li = 10.8;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 9.2e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'fishbase';   
  comment.Wwb = 'based on egg diameter of 2.6 mm: pi/6*0.26^3';
data.Wwi = 17.6;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';   
  comment.Wwi = 'based on 0.00955*Li^3.16, see F1';

data.Ri = 439/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'cdlib';   
  temp.Ri = C2K(26.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data

Wa = [ ... % weight (g), age (yr)
 0.10 0.2
 0.60 0.4
 1.59 0.6
 2.97 0.8
 4.60 1  
 6.33 1.2 
 8.07 1.4
 9.73 1.6
11.27 1.8
12.67 2  
13.92 2.2
15.02 2.4 
15.97 2.6
16.79 2.8
17.50 3  
18.10 3.2];
data.tW = Wa(:,[2 1]); data.tW(:,1) = 365 * data.tW(:,1); % convert yr to d
units.tW = {'d', 'g'}; label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(22.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'PereGalv1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% Facts
F1 = 'length-weight: Ww in g = 0.00955*(TL in cm)^3.16';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6JRFL'; % Cat of Life
metaData.links.id_ITIS = '165650'; % ITIS
metaData.links.id_EoL = '46566780'; % Ency of Life
metaData.links.id_Wiki = 'Fundulus_parvipinnis'; % Wikipedia
metaData.links.id_ADW = 'Fundulus_parvipinnis'; % ADW
metaData.links.id_Taxo = '44519'; % Taxonomicon
metaData.links.id_WoRMS = '276032'; % WoRMS
metaData.links.id_fishbase = 'Fundulus-parvipinnis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fundulus_parvipinnis}}';
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
bibkey = 'PereGalv1998'; type = 'Article'; bib = [ ...  
'author = {H. P\''{e}rez-Espana, F. Galv\''{a}n-Magana and L. A. Abitia-C\''{a}rdenas}, ' ...
'year = {1998}, ' ...
'title = {Growth, consumption, and productivity of the {C}alifornia killifish in {O}jo de {L}iebre {L}agoon, {M}exico}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {52}, '...
'pages = {1068-1077}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Fundulus-parvipinnis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'cdlib'; type = 'Misc'; bib = ...
'howpublished = {\url{http://content.cdlib.org/view?docId=kt6n39n885;NAAN=13030&chunk.id=d0e4062&toc.id=d0e3868&toc.depth=1&brand=calisphere&anchor.id=fig30#X}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


