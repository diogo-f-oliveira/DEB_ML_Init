function [data, auxData, metaData, txtData, weights] = mydata_Corbula_gibba
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Myida'; 
metaData.family     = 'Corbulidae';
metaData.species    = 'Corbula_gibba';
metaData.species_en = 'Basket shell'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE','MAm'};
metaData.ecoCode.habitat = {'0jMp','jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'piPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'aj';  'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.1; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};       
metaData.date_subm = [2021 01 11];                  
metaData.email    = {'bas.kooijman@vu.nl'};              
metaData.address  = {'VU University Amsterdam'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 11]; 

%% set data
% zero-variate data;
data.ab = 0.25;      units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'guess';   
  temp.ab = C2K(14);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab  = 'Trochophore stage'; 
data.aj = 9;      units.aj = 'd';    label.aj = 'age at metamorphosis';  bibkey.aj = 'guess';   
  temp.aj = C2K(14);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
 data.am = 1.4*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'Jens1990';   
  temp.am = C2K(11);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.035;   units.Lj  = 'cm';   label.Lj  = 'total length at metamorphosis';   bibkey.Lj  = 'Jens1990';
data.Lp  = 0.4;    units.Lp  = 'cm';   label.Lp  = 'total length at puberty';         bibkey.Lp  = 'guess';
  comment.Lp = 'based on pubert in autumn after settlement';
data.Li  = 1.2;   units.Li  = 'cm';   label.Li  = 'ultimate total length';           bibkey.Li  = 'marlin';

data.Wwb = 1.131e-7;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.006 cm: pi/6*(0.006)^3';
data.Wdi = 0.0175; units.Wdi = 'g';    label.Wdi = 'ultimate dry weight';             bibkey.Wdi = 'Laur1986';
  comment.Wdi = 'based on same relative weight, compared to Corbicula fluminea: 0.08 * (1.2/2)^3';

data.Ri  = 23000/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'guess';   
temp.Ri = C2K(14);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

%  tL-data from birth to settlement at 27 C 
data.tL = [... % time since 1 April 1986 (d), shell length (cm)
124.507	0.160
152.646	0.357
194.230	0.346
256.090	0.336
369.646	0.336
407.152	0.342
433.407	0.425
459.657	0.513
504.064	0.675
558.731	0.739
608.410	0.741
770.700	0.688];   
units.tL = {'d', 'cm'};  label.tL = {'age', 'shell length'};
temp.tL = [  % time since 1 April 1986 (d), temperature (C)
5.892	3.991
49.916	12.009
70.725	14.796
104.682	15.518
154.873	12.800
190.623	11.424
222.283	9.084
257.010	5.471
351.888	-0.963
372.550	2.649
392.724	9.015
414.027	9.015
440.370	12.628
469.566	16.172
483.970	15.037
491.138	14.658
499.598	15.002
505.139	15.794
510.740	16.241
519.396	15.484
528.150	14.176
534.032	13.041
543.913	13.385
569.953	10.701
577.568	7.811
616.635	3.751];  
units.temp.tL = 'C'; label.temp.tL = 'temperature';
data.tL(:,1) = data.tL(:,1) - 60; units.temp.tL(:,1) = units.temp.tL(:,1) - 60; % set origin at settlement 
bibkey.tL = 'Jens1990';

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

%% Discussion
D1 = 'food density is taken proportional to temperature in tL data';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'can survive long periods (>57 d) under near-anoxic conditions';
metaData.bibkey.F1 = 'Jens1990';
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '7TKT5'; % Cat of Life
metaData.links.id_ITIS = '81744'; % ITIS
metaData.links.id_EoL = '46470548'; % Ency of Life
metaData.links.id_Wiki = 'Corbula'; % Wikipedia
metaData.links.id_ADW = 'Varicorbula_gibba'; % ADW
metaData.links.id_Taxo = '39966'; % Taxonomicon
metaData.links.id_WoRMS = '378492'; % WoRMS
metaData.links.id_molluscabase = '378492'; % molluscabase


%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{http://en.wikipedia.org/wiki/Corbula}},'...
'note = {Accessed : 2021-01-11}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = [...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=4397}},'...
'note = {Accessed : 2021-01-11}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jens1990'; type = 'Article'; bib = [ ... 
'author = {J{\o}rgen N{\o}rrevang Jensen}, ' ... 
'year = {1990}, ' ...
'title = {Increase abundance and growth of the suspension-feeding bivalve \emph{Corbula gibba} in a shallow part of the eutrophic {L}imfjord, {D}enmark}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {27}, ' ...
'number = {1}, '...
'pages = {101-108}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Laur1986'; type = 'Article'; bib = [ ... 
'author = {Diane D. Lauritsen}, ' ... 
'year = {1986}, ' ...
'title = {Filter-feeding in \emph{Corbicula fluminea} and its effect on seston removal}, ' ...
'journal = {J. N. Am. Benthol. Soc.}, ' ...
'volume = {5}, ' ...
'number = {3}, '...
'pages = {165-172}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

