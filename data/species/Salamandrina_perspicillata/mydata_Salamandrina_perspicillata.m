function [data, auxData, metaData, txtData, weights] = mydata_Salamandrina_perspicillata

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Salamandrina_perspicillata'; 
metaData.species_en = 'Northern spectacled salamander';

metaData.ecoCode.climate = {'Csa', 'Cfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc', '0jTf'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                        
metaData.date_subm = [2019 06 28];                            
metaData.email    = {'bas.kooijman@vu.nl'};                   
metaData.address  = {'VU University, 1818HV Amsterdam, the Netherlands'};        

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 28]; 

%% set data
% zero-variate data;
data.ab = 21;       units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'amphibiaweb';
  temp.ab = C2K(14); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '20 to 22 d';
data.tj = 4*30.5;       units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'amphibiaweb';
  temp.tj = C2K(26); units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '2 to 5 month; summer conditions assumed';
data.tp = 4.5*365;       units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'amphibiaweb';
  temp.tp = C2K(22); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 12*365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'amphibiaweb';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.535;      units.Lb = 'cm';   label.Lb = 'SVL at birth';  bibkey.Lb = 'amphibiaweb';
  comment.Lb = 'converted from TL 7 to 13 mm, using F1';
data.Lj = 1.13;       units.Lj = 'cm';   label.Lj = 'SVL at metam';  bibkey.Lj = 'amphibiaweb';
  comment.Lj = 'converted from TL 20 to 35 mm, using F1';
data.Lp = 3.6;       units.Lp = 'cm';   label.Lp = 'SVL at puberty';  bibkey.Lp = 'BoveAnge2006';
data.Li = 5;       units.Li = 'cm';   label.Li = 'ultimate SVL for females';  bibkey.Li = 'BoveAnge2006';

data.Wwb = 0.0042;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 1.5 to 3.7 mm: pi/6*0.2^3'; 
data.Wwp = 0.71;       units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'guess';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 1.91;       units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Mertensiella_caucasica: 4.7*(5/6.75)^3';

data.Ri  = 60/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '30 to 60 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% length-change in length
data.LdL = [ ... % SVL (cm), change in SVL (mm/yr)
2.896	2.702
2.904	0.906
2.997	2.688
2.999	0.877
3.000	3.550
3.092	2.659
3.093	3.507
3.095	1.797
3.190	0.862
3.201	2.630
3.201	2.630
3.202	3.507
3.288	1.811
3.288	1.811
3.301	0.877
3.302	3.565
3.302	3.565
3.310	2.616
3.398	4.413
3.403	1.797
3.403	1.797
3.403	3.522
3.403	3.522
3.408	0.906
3.408	2.645
3.408	2.645
3.414	2.587
3.414	2.587
3.506	1.739
3.515	2.616
3.607	1.797
3.607	1.797
3.623	0.891
3.705	0.906
3.705	1.797
3.797	0.877
4.097	1.782];
data.LdL(:,2) = data.LdL(:,2)/ 3650; % convert mm/yr to cm/d
units.LdL  = {'cm', 'cm/d'};  label.LdL = {'SVL', 'change in SVL'};  
temp.LdL   = C2K(22);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'AngeAnto2008';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 3 * weights.LdL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed, but that for ab is given';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% facts
F1 = 'length-length: TL 85 mm corresponds with SVL 35 mm, so SVL = 0.4118*TL';
metaData.bibkey.F1 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6XBLP'; % Cat of Life
metaData.links.id_ITIS = '775937'; % ITIS
metaData.links.id_EoL = '2920481'; % Ency of Life
metaData.links.id_Wiki = 'Salamandrina_perspicillata'; % Wikipedia
metaData.links.id_ADW = 'Salamandrina_perspicillata'; % ADW
metaData.links.id_Taxo = '985982'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Salamandrina+perspicillata'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Salamandrina_perspicillata}}';   
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
bibkey = 'AngeAnto2008'; type = 'Article'; bib = [ ... 
'author = {Claudio Angelini and Damiano Antonelli and Carlo Utzeri}, ' ... 
'year = {2008}, ' ...
'title = {A multi-year and multi-site population study on the life history of \emph{Salamandrina perspicillata} ({S}avi, 1821) ({A}mphibia, {U}rodela)}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {29}, ' ...
'pages = {161-170}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BoveAnge2006'; type = 'Article'; bib = [ ... 
'author = {Stefano Bovero and Claudio Angelini and Carlo Utzeri}, ' ... 
'year = {2006}, ' ...
'title = {Aging \emph{Salamandrina perspicillata} ({S}avi, 1821) by skeletochronology}, ' ...
'journal = {Acta Herpetologica}, ' ...
'volume = {1(2)}, ' ...
'pages = {153-158}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?where-genus=Salamandrina&where-species=perspicillata}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
