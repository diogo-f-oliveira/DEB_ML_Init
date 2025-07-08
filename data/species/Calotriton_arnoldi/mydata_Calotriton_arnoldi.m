function [data, auxData, metaData, txtData, weights] = mydata_Calotriton_arnoldi

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Calotriton_arnoldi'; 
metaData.species_en = 'Montseny brook newt';

metaData.ecoCode.climate = {'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                        
metaData.date_subm = [2019 06 28];                            
metaData.email    = {'bas.kooijman@vu.nl'};                   
metaData.address  = {'VU University, 1818HV Amsterdam, the Netherlands'};        

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 28]; 

%% set data
% zero-variate data;
data.tp = 3*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AmatOrom2015';   
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'EoL';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'Anage gives 26 yr for Calotriton asper';
  
data.Lp  = 5.2;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';    bibkey.Lp  = 'AmatOrom2015';
data.Li  = 6.8;   units.Li  = 'cm';  label.Li  = 'ultimate SVL';      bibkey.Li  = 'AmatOrom2015';
  comment.Li = 'TL 102.62 mm, amphibiaweb';

data.Wwb = 6.54e-2; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 5 mm of Calotriton asper: pi/6*0.5^3'; 
data.Wwp = 1.48;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'guess';
  comment.Wwp = 'based on from (Lp/L_m)^3*Wwi';
data.Wwi = 3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Hynobius_nebulosus: (6.6/7.8)^3*5';

data.Ri  = 30/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(10); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for Calotriton asper';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), SVL  (cm)
2.972	5.304
2.985	5.507
2.985	5.100
2.997	5.910
2.997	5.801
3.009	6.005
3.009	5.706
3.994	5.906
4.006	5.603
4.006	6.005
4.018	5.490
4.018	6.105
4.018	6.205
4.031	5.802
4.978	5.902
4.991	6.404
4.991	6.209
4.991	5.712
4.991	5.608
5.003	5.811
5.003	5.305
5.028	6.106
5.028	6.006
5.988	6.314
6.012	5.894
6.012	6.509
6.012	6.600
6.012	6.803
6.025	6.119
6.997	6.808
6.997	6.111
6.997	6.003
7.034	5.600
7.982	5.999
7.982	6.302
8.006	6.103
8.031	6.705
9.015	6.406
9.052	6.207];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AmatOrom2015';
comment.tL = 'sexes combined';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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

%% facts
F1 = 'All stages are fully aquatic, does not tolerate temperatues above 15 C';
metaData.bibkey.F1 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'Q4DP'; % Cat of Life
metaData.links.id_ITIS = '775915'; % ITIS
metaData.links.id_EoL = '4358097'; % Ency of Life
metaData.links.id_Wiki = 'Calotriton_arnoldi'; % Wikipedia
metaData.links.id_ADW = 'Calotriton_arnoldi'; % ADW
metaData.links.id_Taxo = '985972'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Calotriton+arnoldi'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Calotriton_arnoldi}}';   
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
bibkey = 'AmatOrom2015'; type = 'Article'; bib = [ ...  
'author = {F\`{e}lix Amat and Neus Orom\''{i} and Delf\''{i} Sanuy and Salvador Carranza}, ' ...
'title = {Sexual dimorphism and age structure of the {M}ontseny newt (\emph{Calotriton arnoldi})}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {36}, ' ...
'pages = {245-252}, ' ...
'year = {2015}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SpecBeuk2016'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Jeroen Speybroeck and Wouter Beukema and Bobby Bok and Jan Van Der Voor}, ' ...
'year = {2016}, ' ...
'title  = {Field Guide to the Amphibians and Reptiles of Britain and Europe}, ' ...
'publisher = {Bloomsbury}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/4358097}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Calotriton+arnoldi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

