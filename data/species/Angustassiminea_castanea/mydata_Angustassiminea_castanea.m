function [data, auxData, metaData, txtData, weights] = mydata_Angustassiminea_castanea
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Littorinimorpha'; 
metaData.family     = 'Assimineidae';
metaData.species    = 'Angustassiminea_castanea'; 
metaData.species_en = 'Saltmarsh snail'; 

metaData.ecoCode.climate = {'Cfb', 'Cwb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L','t-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 27]; 

%% set data
% zero-variate data

data.am = 55*30.5;  units.am = 'd';    label.am = 'life span';               bibkey.am = 'KuraKiku1999';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 0.35; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'KuraKiku2000';
  comment.Lp = 'based on tp 10 mnth';
data.Li  = 0.65; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'KuraKiku2000';

data.Wwb = 1.8e-6; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'KuraKiku2000';
  comment.Wwb = 'based on egg diameter of 150 mum: pi/6*0.015^3';
 
data.Ri  = 162/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';
 
% uni-variate data
% time-length
data.tL = [ ... % time since 1 March(d), shell length (cm)
211.411	0.189
244.248	0.194
306.056	0.196
337.863	0.168
365.587	0.157
396.541	0.227
423.696	0.280
456.193	0.324
487.510	0.352
517.365	0.398
548.853	0.407
576.111	0.448
608.971	0.451
670.723	0.459
702.302	0.457
730.094	0.438
761.445	0.463
% 366.887	0.384
% 396.694	0.416
% 426.602	0.437
% 457.830	0.456
% 489.307	0.447
% 523.343	0.445
% 551.841	0.477
% 580.600	0.480
% 609.279	0.492
% 641.984	0.492
% 669.559	0.480
% 700.787	0.500
% 732.139	0.505
% 759.623	0.504
792.001	0.541
822.158	0.533
850.927	0.535
882.246	0.544
912.233	0.556
942.232	0.566
972.197	0.580
1002.410	0.566
1035.070	0.571
1063.885	0.568
1096.613	0.565
1121.390	0.574];
%[d, i] = sort(data.tL(:,1)); data.tL = data.tL(i,:);
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KuraKiku1999';

% time-weight
data.tWd = [ ... % time since 1 March (d), ashfree dry weight (mg)
209.275	0.079
240.051	0.094
302.833	0.089
332.378	0.058
364.385	0.043
390.236	0.144
425.936	0.265
454.250	0.386
482.563	0.472
513.339	0.715
547.808	0.745
574.890	0.993
606.897	1.018
669.680	1.058
697.993	1.038
725.076	0.946
760.776	1.093
% 363.769	0.643
% 394.545	0.784
% 425.320	0.926
% 457.327	1.027
% 485.641	1.002
% 515.186	0.956
% 547.192	1.184
% 580.430	1.169
% 608.744	1.280
% 634.595	1.275
% 671.526	1.184
% 698.609	1.331
% 730.616	1.361
% 758.929	1.361
794.629	1.675
821.712	1.594
853.718	1.599
880.801	1.690
914.039	1.802
915.270	1.797
943.584	1.893
973.128	2.009
1003.904	1.918
1034.680	1.948
1064.224	1.933
1093.769	1.898
1127.007	1.964];
%[d, i] = sort(data.tWd(:,1)); data.tWd = data.tWd(i,:);
units.tWd   = {'d', 'mg'};  label.tWd = {'time since birth', 'ash-free dry weight'};  
temp.tWd    = C2K(17);  units.temp.tWd = 'K'; label.temp.tWd = 'temperature';
bibkey.tWd = 'KuraKiku1999';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
F1 = 'temperature in C varies as T(t) = 17 + 14*sin(2*pi*(t-140)/365';
metaData.discussion = struct('F1',F1);

%% Facts
F1 = 'This species has a veliger stage';
metaData.bibkey.F1 = 'KuraKiku1999'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '66QLZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '29332351'; % Ency of Life
metaData.links.id_Wiki = 'Angustassiminea'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1686955'; % Taxonomicon
metaData.links.id_WoRMS = '765243'; % WoRMS
metaData.links.id_molluscabase = '765243'; % molluscabase


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
bibkey = 'KuraKiku1999'; type = 'Article'; bib = [ ... 
'author = {Kengo Kurata and Eisuke Kikuchi}, ' ... 
'year = {1999}, ' ...
'title = {LIFE CYCLE AND PRODUCTION OF \emph{Assiminea japonica} V. {M}ARTENS AND \emph{Angustassiminea castanea} ({W}ESTERLUND) AT A REED MARSH IN {G}AMO {L}AGOON, {N}ORTHERN {J}APAN ({G}ASTROPODA: {A}SSIMINEIDAE)}, ' ...
'journal = {Ophelia}, ' ...
'volume = {50(3)}, ' ...
'pages = {191-214}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KuraKiku2000'; type = 'Article'; bib = [ ... 
'author = {Kengo Kurata and Eisuke Kikuchi}, ' ... 
'year = {2000}, ' ...
'title = {Comparisons of life-history traits and sexual dimorphism between \emph{Assiminea japonoca} and \emph{Angustassiminea castanea} ({G}astropoda: {A}ssimineidae}, ' ...
'journal = {J. Moll. Stud}, ' ...
'volume = {66}, ' ...
'pages = {177-196}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

