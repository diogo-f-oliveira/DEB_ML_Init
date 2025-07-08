  function [data, auxData, metaData, txtData, weights] = mydata_Xiphophorus_montezumae
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Poeciliidae';
metaData.species    = 'Xiphophorus_montezumae'; 
metaData.species_en = 'Montezuma swordtail'; 

metaData.ecoCode.climate = {'Am','Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 01];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU Univ. Amsterdam'};      

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc    = [2020 10 01]; 

%% set data
% zero-variate data
data.am = 5*365;        units.am = 'd';  label.am = 'maximum life span';   bibkey.am = 'guess';
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.83;  units.Lb = 'cm';  label.Lb = 'total length at birth';     bibkey.Lb = 'MoshEagd2015';
  comment.Lb = 'value for Xiphophorus helleri';
data.Lp = 3.2;  units.Lp = 'cm';  label.Lp = 'total length at puberty';    bibkey.Lp = 'guess';
data.Li = 6.5;  units.Li = 'cm';  label.Li = 'ultimate total length';        bibkey.Li = 'fishbase';
data.Lim = 5.5;  units.Lim = 'cm';  label.Lim = 'ultimate total length for males';  bibkey.Lim = 'fishbase';

data.Wwb = 3e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';    bibkey.Wwb = {'MoshEagd2015','fishbase'};   
  comment.Wwb = 'based on 0.00708*Lb^3.13, see F1';
data.Wwp = 0.27; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.00708*Lp^3.13, see F1';
data.Wwi = 2.48; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.13, see F1';
data.Wwim = 1.47; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';      bibkey.Wwim = {'guess','fishbase'};
   comment.Wwi = 'based on 0.00708*Lim^3.13, see F1';

data.Ri = 20/32;       units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '15-30 pups per litter, litter interval 4-5 wk';
    
% univariate data
% time - length
data.tL = [ ... % time (d), std length (cm)
8.195	1.345
27.655	1.908
55.493	2.429
83.327	2.978
109.300	3.527
153.908	3.857
184.593	3.953
244.113	4.063
276.653	4.200
323.148	4.324
352.905	4.406
378.010	4.488
407.756	4.653
442.163	4.735
481.218	4.845
513.762	4.955
544.454	4.996
614.205	5.120];
data.tL(:,2) = data.tL(:,2)/ 0.79; % convert SL to TL 
units.tL = {'d','cm'};  label.tL = {'time since birth','total length'};     
temp.tL = C2K(25); units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'KrueRose2011';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length - weight: Ww in g = 0.00708 * (TL in cm)^3.13';
  metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.79 * TL';
metaData.bibkey.F2 = 'Wiki';
F3 = 'viviparous';
metaData.bibkey.F3 = 'Wiki';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '5CFPQ'; % Cat of Life
metaData.links.id_ITIS = '165927'; % ITIS
metaData.links.id_EoL = '1012112'; % Ency of Life
metaData.links.id_Wiki = 'Xiphophorus_montezumae'; % Wikipedia
metaData.links.id_ADW = 'Xiphophorus_montezumae'; % ADW
metaData.links.id_Taxo = '190136'; % Taxonomicon
metaData.links.id_WoRMS = '1019001'; % WoRMS
metaData.links.id_fishbase = 'Xiphophorus-montezumae'; % fishbase


%% References

bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Xiphophorus-montezumae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Xiphophorus_montezumae}}';
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
bibkey = 'KrueRose2011'; type = 'Article'; bib = [ ...
'doi = {10.1080/10236244.2011.598644}, ' ...
'author = {Karla Kruesi and Gil G. Rosenthal and Guillermina Alcaraz}, ' ...
'year = {2011}, ' ...
'title = {Growth and male ornamentation in \emph{Xiphophorus montezumae}}, ' ... 
'journal = {Marine and Freshwater Behaviour and Physiology}, ' ...
'pages = {1-11}, ', ...
'volume = {iFirst}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MoshEagd2015'; type = 'Article'; bib = [ ...
'author = {Fatemeh Moshayedi and Soheil Eagderi and Firooze Parsazade and Hoda Azimi and Hamed Mousavi-Sabet}, ' ...
'year = {2015}, ' ...
'title = {Allometric growth pattern of the swordtail - \emph{Xiphophorus helleri} ({C}yprinodontiformes, {P}oeciliidae) during early development}, ' ... 
'journal = {Poeciliid Research}, ' ...
'pages = {18-23}, ', ...
'volume = {5(1)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

