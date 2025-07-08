  function [data, auxData, metaData, txtData, weights] = mydata_Micrurus_fulvius
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Elapidae';
metaData.species    = 'Micrurus_fulvius'; 
metaData.species_en = 'Eastern coral snake'; 

metaData.ecoCode.climate = {'BSk', 'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'biTf', 'biTa'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ww_L'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 17]; 

%% set data
% zero-variate data
data.ab = 49;        units.ab = 'd';  label.ab = 'age at birth';        bibkey.ab = 'Quin1979';
  temp.ab = C2K(23); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '78 to 93 d';
data.am = 19*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'AnAge';
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 20.25;      units.Lb = 'cm';     label.Lb = 'total length at birth';  bibkey.Lb = 'Quin1979';
data.Lp = 43.18;     units.Lp = 'cm';     label.Lp = 'total length at puberty for females'; bibkey.Lp = 'Quin1979'; 
data.Lpm = 40.2;     units.Lpm = 'cm';     label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'Quin1979'; 
data.Li = 112.4;     units.Li = 'cm';     label.Li = 'ultimate total length for females';  bibkey.Li = 'Quin1979';
data.Lim = 68.5;     units.Lim = 'cm';     label.Lim = 'ultimate total length for males';  bibkey.Lim = 'Quin1979';

data.Wwb = 2.3;     units.Wwb = 'g';     label.Wwb = 'weight at birth';  bibkey.Wwb = 'Quin1979';
  comment.Wwb = 'based on egg size 3.34 x 1.15 cm: pi/6*3.34*1.15^2';
data.Ww60 = 33.3;    units.Ww60 = 'g';    label.Ww60 = 'weight at SVL 59.6 cm';  bibkey.Ww60 = 'Quin1979';
data.Ww55 = 30.1;    units.Ww55 = 'g';    label.Ww55 = 'weight at SVL 55.1 cm';  bibkey.Ww55 = 'Quin1979';

data.Ri = 12/365;  units.Ri = '#/d';  label.Ri = 'reprod rate at SVL 136.7 cm';  bibkey.Ri = 'Quin1979';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'max of 12 eggs per clutch, 1 clutch every 1 yr';
   
% univariate data
% time - length
data.tL = [ ... % time (d), total length (cm)
212.000	21.203
270.090	26.977
270.769	23.609
300.588	29.504
301.257	25.053
301.267	26.135
332.463	27.459
365+60.318	28.662
365+89.351	25.774
365+90.118	32.391
365+90.813	30.827
365+91.487	26.857
365+91.502	28.541
365+91.518	30.346
365+120.568	29.383
365+182.296	37.083
365+182.317	39.489
365+210.681	41.053
365+211.406	42.977
365+213.476	36.602
365+239.040	42.135
365+239.052	43.579
365+239.060	44.421
365+240.485	45.263
365+244.720	43.338
365+270.158	34.677
365+270.205	39.970
365+270.214	40.932
365+270.222	41.895
365+271.660	44.180
365+272.322	38.887
365+301.389	39.970
365+331.875	41.053
365+331.949	49.474
730+64.029	47.549
730+90.181	39.489
730+90.188	40.211
730+90.238	45.865
730+94.440	40.211
730+119.958	40.571
730+119.999	45.263
730+120.721	46.707
730+125.625	40.211
730+149.015	40.451
730+149.813	50.556
730+179.605	53.323
730+179.611	54.045
730+182.401	48.992
730+182.413	50.316
730+183.052	42.376
730+210.743	48.150
730+210.763	50.316
730+210.795	53.925
730+211.428	45.383
730+215.000	48.632
730+216.388	45.263
730+237.730	54.286
730+239.819	50.075
730+239.829	51.278
730+269.578	49.233
730+269.584	49.835
730+269.588	50.316
730+270.313	52.120
730+270.317	52.602
730+270.337	54.887
730+270.361	57.534
730+270.384	60.180
730+271.765	56.090
730+273.194	57.414
730+275.312	56.451
730+276.738	57.414
730+280.282	57.414
730+301.521	54.767
730+301.537	56.571
730+329.951	63.910
730+330.588	55.850
730+330.622	59.699];
data.tL(:,1) = data.tL(:,1) - 212; % set origin of time at birth
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Quin1979';
comment.tL = 'data based on length frequencies';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6RJM8'; % Cat of Life
metaData.links.id_ITIS = '174354'; % ITIS
metaData.links.id_EoL = '962855'; % Ency of Life
metaData.links.id_Wiki = 'Micrurus_fulvius'; % Wikipedia
metaData.links.id_ADW = 'Micrurus_fulvius'; % ADW
metaData.links.id_Taxo = '50230'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Micrurus&species=fulvius'; % ReptileDB
metaData.links.id_AnAge = 'Micrurus_fulvius'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Micrurus_fulvius}}';
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
bibkey = 'Quin1979'; type = 'Article'; bib = [ ...  
'author = {Hugh R. Quinn}, ' ...
'year = {1979}, ' ...
'title = {Reproduction and Growth of the {T}exas Coral Snake (\emph{Micrurus fulvius tenere})}, ' ... 
'journal = {Copeia}, ' ...
'volume = {1979(3)}, '...
'pages = {453-463}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Micrurus_fulvius}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


