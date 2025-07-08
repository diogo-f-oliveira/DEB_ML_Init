function [data, auxData, metaData, txtData, weights] = mydata_Cottus_hangiongensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Cottus_hangiongensis'; 
metaData.species_en = 'Hokkaido sculpin'; 

metaData.ecoCode.climate = {'Dfa','Cfb','MC'};
metaData.ecoCode.ecozone = {'THp','MPNW'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 08 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 24];


%% set data
% zero-variate data

data.am = 8 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'Goto1989';   
  temp.am = C2K(13);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 5.2;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Goto1989'; 
  comment.Lp = 'based on purberty in second yr and tL data';
data.Li  = 15;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';

data.Wwb = 4.8e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2.1 mm for Cottus beldingii: pi/6*0.21^3';
data.Wwi = 21.7;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*Li^3.13, see F1';
  
data.Ri = 500/365; units.Ri = '#/d'; label.Ri = 'reproduction rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(13);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tL = [ ... % age (years), total length (cm)
1.571	6.148
1.745	6.148
2.081	6.204
2.243	6.222
2.448	6.222
2.586	6.481
2.752	7.574
3.013	7.611
3.182	7.685
3.343	7.741
3.594	8.204
3.781	8.259
4.191	8.315
4.448	8.704
4.772	8.926
5.170	9.056
5.357	9.019
5.606	9.019];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(13);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Goto1989';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 10;

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
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6B8DP'; % Cat of Life
metaData.links.id_ITIS = '643935'; % ITIS
metaData.links.id_EoL = '46568951'; % Ency of Life
metaData.links.id_Wiki = 'Cottus_hangiongensis'; % Wikipedia
metaData.links.id_ADW = 'Cottus_hangiongensis'; % ADW
metaData.links.id_Taxo = '172066'; % Taxonomicon
metaData.links.id_WoRMS = '274369'; % WoRMS
metaData.links.id_fishbase = 'Cottus-hangiongensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cottus_hangiongensis}}';
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
bibkey = 'Goto1989'; type = 'Article'; bib = [ ... 
'author = {Akira Goto}, ' ... 
'year = {1989}, ' ...
'title = {Growth patterns, and age and size at maturity in female \emph{Cottus hangiongensis}, with special reference to their life-history variation}, ' ...
'journal = {Japanese Journal of Ichthyology}, ' ...
'volume = {36(1)}, ' ...
'pages = {90-99}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cottus-hangiongensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

