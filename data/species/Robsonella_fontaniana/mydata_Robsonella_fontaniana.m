function [data, auxData, metaData, txtData, weights] = mydata_Robsonella_fontaniana

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Octopodidae';
metaData.species    = 'Robsonella_fontaniana'; 
metaData.species_en = 'Small octopus'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSE','MASW'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Mb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Li'; 'Wwb'; 'Ww_t'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 04 13];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 04 13]; 

%% set data
% zero-variate data

data.am = 365;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'guess';   
  temp.am = C2K(11); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.2;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';     bibkey.Lb  = 'UriaHern2010';
data.Li  = 5;  units.Li  = 'cm'; label.Li  = 'mantle length at death';     bibkey.Li  = 'Wiki';
  comment.Li = 'GonzArri2008 total length 26 cm';
data.Lim  = 5.4;  units.Lim  = 'cm'; label.Lim  = 'mantle length at death for males';     bibkey.Lim  = 'GonzArri2008';
  comment.Lim = 'based on GonzArri2008 total length 28 cm: 5*28/26';

data.Wwb  = 0.0129;  units.Wwb  = 'g'; label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'GonzArri2008';
  comment.Wwb = 'based on egg length of 4.77 mm, width 2.27 mm: pi/6*0.477*0.227^2';
data.Ww160  = 1.8;  units.Ww160  = 'g'; label.Ww160  = 'wet weight at 160 d since birth';     bibkey.Ww160  = 'UriaHern2010';
data.Wwp  =32;  units.Wwp  = 'g'; label.Wwp  = 'wet weight at puberty';     bibkey.Wwp  = 'guess';
  comment.Wwp = 'based on same relative weight, compared to Paroctopus_digueti: 8*200/49.5';
data.Wwi  = 200;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';     bibkey.Wwi  = 'UriaHern2010';

data.Ni  = 2500; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'UriaHern2010';   
  temp.Ni = C2K(11);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), mantle length (cm)
0.236	0.232
0.236	0.203
14.613	0.200
14.613	0.230
14.848	0.161
35.118	0.231
35.118	0.281
35.118	0.345
36.061	0.191
48.788	0.219
48.788	0.417
58.923	0.311
69.529	0.645
69.764	0.319
69.764	0.354
70.000	0.457
70.000	0.680
70.236	0.507
70.236	0.561
70.471	0.739
77.306	0.550
78.013	0.491
95.690	0.636
95.690	0.596
95.926	0.730
96.162	0.477
96.162	0.443
101.111	0.541
107.710	0.980
107.946	0.470
117.845	0.869
122.559	1.042];
n=size(data.tL,1);for i=2:n;if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-8;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'mantle length'};  
temp.tL    = C2K(11);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'UriaHern2010';
comment.tL = 'Data for females and males combined';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.am = 5 * weights.am;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4T89Q'; % Cat of Life
metaData.links.id_ITIS = '557226'; % ITIS
metaData.links.id_EoL = '45409478'; % Ency of Life
metaData.links.id_Wiki = 'Robsonella'; % Wikipedia
metaData.links.id_ADW = 'Robsonella_fontaniana'; % ADW
metaData.links.id_Taxo = '158339'; % Taxonomicon
metaData.links.id_WoRMS = '342384'; % WoRMS
metaData.links.id_molluscabase = '342384'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Robsonella}}';
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
bibkey = 'UriaHern2010'; type = 'article'; bib = [ ... 
'author = {Iker Uriate and Jorge Herna\''{a}ndez and Jessica D\"{o}rner and Kurt Paschke and Ana Fari\''{a}s and Enzo Crovetto and Carlos Rosas}, ' ... 
'year = {2010}, ' ...
'title = {Rearing and Growth of the Octopus \emph{Robsonella fontaniana} ({C}ephalopoda: {O}ctopodidae) From Planktonic Hatchlings to Benthic Juveniles}, ' ...
'journal = {Biol. Bull.}, ' ...
'volume = {218}, ' ...
'pages = {200-210}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GonzArri2008'; type = 'article'; bib = [ ... 
'author = {Mar\''{i}a Luisa Gonz\''{a}alez and Sergio E. Arriagada and Daniel A. L\''{o}opez and Margarita C. P\''{e}erez}, ' ... 
'year = {2008}, ' ...
'title = {Reproductive aspects, eggs and paralarvae of \emph{Robsonella fontanianus} (d''{O}rbigny, 1834)}, ' ...
'journal = {Aquaculture Research}, ' ...
'volume = {39}, ' ...
'pages = {1569-1573}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Robsonella-fontaniana.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

