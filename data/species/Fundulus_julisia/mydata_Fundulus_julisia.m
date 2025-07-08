  function [data, auxData, metaData, txtData, weights] = mydata_Fundulus_julisia
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Fundulidae';
metaData.species    = 'Fundulus_julisia'; 
metaData.species_en = 'Barrens topminnow'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 01];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 01]; 

%% set data
% zero-variate data
data.ab = 200/24;        units.ab = 'd';  label.ab = 'age at birth';     bibkey.ab = 'Rake1989';
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 3*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'Rake1989';
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 3.9;     units.Lp = 'cm';     label.Lp = 'standard length at puberty'; bibkey.Lp = 'Rake1989'; 
data.Li = 5.5;     units.Li = 'cm';     label.Li = 'ultimate standard length';  bibkey.Li = 'Rake1989';

data.Wwb = 6.4e-3;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'Rake1989';   
  comment.Wwb = 'based on egg diameter of 2.3 mm: pi/6*0.23^3';
data.Wwi = 2.04;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';   
  comment.Wwi = 'based on 0.00603*(Li/0.83)^3.08, see F1, F2';

data.Ri = 250/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(26.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time - length
data.tL = [ ... % time since birth (d), std length (mm)
4.621	7.674
8.284	10.266
13.338	11.063
18.366	12.259
23.153	17.243
33.171	20.233
44.542	22.027
48.307	23.023
55.907	23.920
61.931	29.502
84.737	32.093
84.921	29.203
96.413	29.103
111.021	40.166
119.066	34.086
137.954	38.073
149.146	42.658
174.905	38.970
275.632	40.365
280.622	42.159
289.364	45.150
300.818	45.648
326.137	48.837
345.247	49.336
375.742	51.429
389.830	50.631
408.852	52.525
438.158	53.223
473.802	54.618
626.914	55.017];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Rake1989';

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
                  
%% Facts
F1 = 'length-weight: Ww in g = 0.00603*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo SL =  0.83 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6K3GG'; % Cat of Life
metaData.links.id_ITIS = '165677'; % ITIS
metaData.links.id_EoL = '212508'; % Ency of Life
metaData.links.id_Wiki = 'Fundulus_julisia'; % Wikipedia
metaData.links.id_ADW = 'Fundulus_julisia'; % ADW
metaData.links.id_Taxo = '174573'; % Taxonomicon
metaData.links.id_WoRMS = '1012239'; % WoRMS
metaData.links.id_fishbase = 'Fundulus-julisia'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Fundulus_julisia}}';
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
bibkey = 'Rake1989'; type = 'phdthesis'; bib = [ ...  
'author = {Patrick L. Rakes}, ' ...
'year = {1989}, ' ...
'title = {Life History and Ecology of the {B}arrens Topminnow, \emph{undulus julisia} {W}illiams and {E}tnier ({P}isces, {F}undulidae)}, ' ... 
'school = {Univ. of Tennessee, Knoxville}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Fundulus-julisia.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


