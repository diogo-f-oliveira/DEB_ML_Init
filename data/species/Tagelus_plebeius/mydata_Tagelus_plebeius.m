function [data, auxData, metaData, txtData, weights] = mydata_Tagelus_plebeius

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Cardiida'; 
metaData.family     = 'Solecurtidae';
metaData.species    = 'Tagelus_plebeius'; 
metaData.species_en = 'Razor clam'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'am';  'Lp'; 'Li'; 'Wwb'; 'Wdi'; 'R_i'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 05 08];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 08]; 


%% set data
% zero-variate data

data.am = 15*30.5; units.am = 'd';    label.am = 'life span';                     bibkey.am = 'guess';   
  temp.am = C2K(24);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'guess';
data.Li  = 6.5; units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'SilvCort2015';

data.Wwb = 5e-8;    units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'SilvCort2015';
  comment.Wwb = 'based on egg diameter of 46 mum: pi/6*0.0046^3';
data.Wdi = 2.5;    units.Wdi = 'g';  label.Wdi = 'dry weight at birth';   bibkey.Wdi = 'guess';
  comment.Wdi = 'based on L-Wd relationship of Abra segmentum';

data.Ri = 8e7/365; units.Ri  = '#/d';   label.Ri  = 'max reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.93';
 
% uni-variate data
% t-L data
data.tL = [ ... % time (yr), shell length (cm)
0.423	1.363
0.690	2.141
0.711	2.198
0.750	2.347
0.836	2.702
0.999	2.931
1.281	3.435
1.323	3.115
1.482	3.962
1.523	4.225
1.583	4.557
1.604	4.397
1.670	4.534
1.751	4.649
1.802	4.786
1.908	4.809
1.965	4.763
2.031	4.901
2.112	4.992
2.187	4.947
2.196	4.832
2.226	5.038
2.307	5.221
2.370	4.981
2.406	5.267
2.484	5.221
2.550	5.313
2.628	5.450
2.724	5.405];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SilvCort2015';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: log total weight (mg) = 2.667 * log length (mm) - 0.358; log shell weight (mg) = 2.719 log length (mm) - 0.627';
metaData.bibkey.F1 = 'AnseFren1980'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '54JPF'; % Cat of Life
metaData.links.id_ITIS = '81272'; % ITIS
metaData.links.id_EoL = '46474989'; % Ency of Life
metaData.links.id_Wiki = 'Tagelus'; % Wikipedia
metaData.links.id_ADW = 'Tagelus_plebeius'; % ADW
metaData.links.id_Taxo = '195314'; % Taxonomicon
metaData.links.id_WoRMS = '157001'; % WoRMS
metaData.links.id_molluscabase = '157001'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tagelus}}';
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
bibkey = 'SilvCort2015'; type = 'Article'; bib = [ ...
'doi = {10.1007/s10152-014-0417-0}, ' ...
'author = {Camila Fernanda da Silva and Guilherme Nascimento Corte and Leonardo Querobim Yokoyama and Jolnnye Rodrigues Abrahao and Ant\^{o}nia Cec\''{i}lia Zacagnini Amaral}, ' ... 
'year = {2015}, ' ...
'title = {Growth, mortality, and reproduction of \emph{Tagelus plebeius} ({B}ivalvia: {S}olecurtidae) in Southeast {B}razil}, ' ...
'journal = {Helgol Mar Res}, ' ...
'volume = {69}, ' ...
'pages = {1-12}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Tagelus-plebeius.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


