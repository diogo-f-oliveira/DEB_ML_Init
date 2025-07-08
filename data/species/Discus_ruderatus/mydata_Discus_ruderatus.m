function [data, auxData, metaData, txtData, weights] = mydata_Discus_ruderatus
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Discidae';
metaData.species    = 'Discus_ruderatus'; 
metaData.species_en = 'Brown disk snail'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Thw'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biO'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 20]; 

%% set data
% zero-variate data

data.ab  = 21;   units.ab  = 'd'; label.ab  = 'age at birth';     bibkey.ab  = 'Kuzn2006';   
  temp.ab = C2K(21.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '17-34 d';
data.am  = 580;   units.am  = 'd'; label.am  = 'life span';     bibkey.am  = 'Kuzn2006';   
  temp.am = C2K(21.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.15; units.Lb  = 'cm';  label.Lb  = 'shell breath at birth';   bibkey.Lb  = 'Kuzn2006';
data.Lp  = 0.6; units.Lp  = 'cm';  label.Lp  = 'shell breath at puberty';   bibkey.Lp  = 'Kuzn2006';
data.Li  = 0.7; units.Li  = 'cm';  label.Li  = 'ultimate shell breath';   bibkey.Li  = 'animalbase';

data.Wdi  = 6.4e-3; units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'Will1976';
  comment.Wdi = 'based on size-corrected value for Cepaea nemoralis: (0.7/2.2)^3*0.2';

data.Ni  = 6;   units.Ni  = '#'; label.Ni  = 'life time reproduction output';     bibkey.Ni  = 'Kuzn2006';   
  temp.Ni = C2K(21.5);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % age (d), number of whorls (#)
0	2.209
0	1.759
0	1.800
0	2.168
0	2.073
0	1.882
0	1.991
29	2.672
29	2.727
29	2.631
29	2.822
29	2.563
29	2.509
29	2.345
29	2.427
64	3.572
64	3.654
64	3.285
64	3.340
64	3.422
64	3.476
100	4.130
100	4.157
100	3.939
100	4.021
100	4.498
100	4.607
100	4.307
100	4.376
124	4.552
124	4.662
124	4.689
124	4.771
124	4.839
124	4.443
124	4.484
159	4.893
159	5.002
159	4.661
159	4.688
159	4.756
159	4.838
209	5.192
209	5.097
209	4.988
209	5.015
209	5.056
209	4.729
209	4.879
244	5.192
244	5.164
244	5.055
244	5.110
244	4.837
244	4.987
281	5.205
281	5.259
281	5.000
281	5.041
281	5.096
491	5.177
491	5.204
491	5.081
491	4.945
707	5.217
707	4.972
707	5.081];
data.tL(:,2) = data.Lb*(data.Li/ data.Lb).^((data.tL(:,2)-data.tL(1,2))/(data.tL(end,2)-data.tL(1,2)));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(21.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Kuzn2006';
comment.tL = 'based on # of whorls, assuming a constant factor per whorl, given Lb and Li';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Ni = 5 * weights.Ni;
weights.Lb = 10 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Kuzn2006'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6DBG5'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4898588'; % Ency of Life
metaData.links.id_Wiki = 'Discus_ruderatus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW  not present 
metaData.links.id_Taxo = '38721'; % Taxonomicon 
metaData.links.id_WoRMS = '1050209'; % WoRMS
metaData.links.id_molluscabase = '1050209'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Discus_perspectivus}}';
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
bibkey = 'Kuzn2006'; type = 'Article'; bib = [ ... 
'author = {El\dot{z}bieta Ku\''{z}nik-{K}owalska}, ' ... 
'title = {LIFE CYCLE OF \emph{Discus ruderatus} (F\''{e}russac, 1821) ({G}ASTROPODA: {P}ULMONATA: {E}NDODONTIDAE)}, ' ...
'journal = {Folia Malacologica}, ' ...
'volume = {14}, ' ...
'year = {2006}, ' ...
'pages = {35-46}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Will1976'; type = 'Article'; bib = [ ... 
'author = {Phillip Williampson}, ' ... 
'title = {Size-weight relationships and field growth rates of the landsnail \emph{Cepaea nemoralis} {L}.}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'number = {3}, ' ...
'volume = {45}, ' ...
'year = {1976}, ' ...
'pages = {875-885}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'animalbase'; type = 'Misc'; bib = ...
'howpublished = {\urlhttp://www.animalbase.uni-goettingen.de/zooweb/servlet/AnimalBase/home/species?id=1239}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
